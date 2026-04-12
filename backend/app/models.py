from pydantic import BaseModel, Field, ConfigDict
from typing import Optional
from datetime import datetime

class UserProfile(BaseModel):
    model_config = ConfigDict(populate_by_name=True)
    id: Optional[str] = Field(None, alias="_id")
    email: str
    password: str
    name: str
    current_week: int
    dueDate: datetime


class Mother(BaseModel):
    id: Optional[str] = Field(None, alias="_id")
    body_changes: str
    emotional_changes: str
    common_symptoms: str


class Baby(BaseModel):
    id: Optional[str] = Field(None, alias="_id")
    size_comparison: str
    expected_weight: str
    expected_development: str


class Week(BaseModel):
    model_config = ConfigDict(populate_by_name=True)
    id: Optional[str] = Field(None, alias="_id")
    week: int
    mother: Mother
    baby: Baby
