from motor.motor_asyncio import AsyncIOMotorClient
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    mongodb_uri: str
    database_name: str = "pregnancy_app"

    class Config:
        env_file = ".env"

settings = Settings()

client = AsyncIOMotorClient(settings.mongodb_uri)
db = client[settings.database_name]

def get_collection(name: str):
    return db[name]
