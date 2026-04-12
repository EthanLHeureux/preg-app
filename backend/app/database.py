from motor.motor_asyncio import AsyncIOMotorClient
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    mongodb_uri: str
    database_name: str = "pregnancy_app"

    # Changed due to automated script tests needing updated way to load .env file.
    model_config = SettingsConfigDict(env_file=".env")

settings = Settings()

client = AsyncIOMotorClient(settings.mongodb_uri)
db = client[settings.database_name]

def get_collection(name: str):
    return db[name]
