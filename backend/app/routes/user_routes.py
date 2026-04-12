from fastapi import Body, APIRouter
from app.database import db  
from app.models import UserProfile
from datetime import datetime, date

router = APIRouter()

@router.post("/users")
async def create_user_profile(user: UserProfile = Body(...)):
    user_data = user.model_dump(by_alias=True, exclude_unset=True)

    # 2. If the ID is None, remove it so MongoDB generates a fresh one
    if user_data.get("_id") is None:
        user_data.pop("_id", None)

    # Convert date to datetime so MongoDB can store it
    if isinstance(user_data.get("dueDate"), date):
        user_data["dueDate"] = datetime.combine(user_data["dueDate"], datetime.min.time())

    # 3. Insert into your "Users" collection
    new_user = await db["Users"].insert_one(user_data)
    
    return {"message": "User created", "id": str(new_user.inserted_id)}

