from fastapi import APIRouter, HTTPException
from app.database import db

router = APIRouter()

@router.get("/devotions")
async def get_devotional_by_week(week: int):
    
    # Fetch the specific week from MongoDB.
    devotion = await db["Devotions"].find_one({"week": week})
    
    if not devotion:
        raise HTTPException(status_code=404, detail=f"No devotional found for week {week}")
    
    # Clean the ID for Swift due to unknown BSON 'ObjectId' type.
    devotion["_id"] = str(devotion["_id"])
    
    return devotion