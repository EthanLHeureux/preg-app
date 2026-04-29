from fastapi import APIRouter, HTTPException
from app.database import db

router = APIRouter()

@router.get("/home/{week}")
async def get_home_data(week: int):
    
    # Fetch the home data from MongoDB.
    home_data = await db["Weeks"].find_one({"week": week})
    
    
    if not home_data:
        raise HTTPException(status_code=404, detail="Home data not found")
    
    # Clean the ID for Swift due to unknown BSON 'ObjectId' type.
    home_data["_id"] = str(home_data["_id"])
    
    return home_data
