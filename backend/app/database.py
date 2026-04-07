from motor.motor_asyncio import AsyncIOMotorClient
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    # Ensure your password and username are correct here
    mongodb_uri: str
    database_name: str = "PregnancyApp"

    class Config:
        env_file = ".env"

settings = Settings()

# Use Motor for the async connection
client = AsyncIOMotorClient(settings.mongodb_uri)
db = client[settings.database_name]

def get_collection(name: str):
    return db[name]\
    
