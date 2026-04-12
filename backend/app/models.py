from pydantic import BaseModel, Field, ConfigDict, EmailStr
from typing import Optional
from datetime import datetime


class Mother(BaseModel):
    body_changes: str
    emotional_changes: str
    common_symptoms: str


class Baby(BaseModel):
    size_comparison: str
    expected_weight: str
    expected_development: str


class Week(BaseModel):
    model_config = ConfigDict(populate_by_name=True)
    id: Optional[str] = Field(None, alias="_id")
    week: int
    mother: Mother
    baby: Baby


class UserProfile(BaseModel):
    model_config = ConfigDict(populate_by_name=True)
    id: Optional[str] = Field(None, alias="_id")
    email: EmailStr
    password: str
    name: str
    current_week: int
    dueDate: datetime


class LoginRequest(BaseModel):
    email: EmailStr
    password: str