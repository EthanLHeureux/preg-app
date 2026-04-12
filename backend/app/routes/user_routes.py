from fastapi import Body, APIRouter, HTTPException, status
from app.models import UserProfile, LoginRequest
from datetime import datetime, date
from app.database import db  
from bson import ObjectId


router = APIRouter()

@router.post("/users")
async def create_user_profile(user: UserProfile = Body(...)):
    user_data = user.model_dump(by_alias=True, exclude_unset=True)

    # If the ID is None, remove it so MongoDB generates a fresh one.
    user_data.pop("_id", None)

    # Convert date to datetime so MongoDB can store it due to swift, fast, and mongo's date handling.
    if isinstance(user_data.get("dueDate"), date):
        user_data["dueDate"] = datetime.combine(user_data["dueDate"], datetime.min.time())

    # Check if the email is already registered.
    if await db["Users"].find_one({"email": user_data["email"]}):
        raise HTTPException(status_code=400, detail="Email already registered")

    new_user = await db["Users"].insert_one(user_data)
    
    return {"message": "User created", "id": str(new_user.inserted_id)}




@router.get("/users/{user_id}")
async def get_user_profile(user_id: str):

    # Convert the string user_id to an ObjectId for Mongo.
    user_data = await db["Users"].find_one({"_id": ObjectId(user_id)})
    
    # Handle the "Not Found" case.
    if not user_data:
        raise HTTPException(status_code=404, detail="User not found")

    user_data["_id"] = str(user_data["_id"])    

    return user_data




@router.post("/login")
async def login(credentials: LoginRequest):

    user = await db["Users"].find_one({"email": credentials.email})
    
    if not user or user["password"] != credentials.password:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password"
        )
    
    user["_id"] = str(user["_id"])
    
    return user
