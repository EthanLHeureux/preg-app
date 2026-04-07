from fastapi import FastAPI
from contextlib import asynccontextmanager
from app.database import client  

@asynccontextmanager
async def lifespan(app: FastAPI):
    try:
        # Motor's way of pinging the server
        await client.admin.command('ping')
        print("✨ Connected to MongoDB Atlas successfully!")
    except Exception as e:
        print(f"❌ Database connection error: {e}")
    yield
    # Motor clients don't strictly require a close() on lifespan 
    client.close()

app = FastAPI(lifespan=lifespan)

@app.get("/")
async def health_check():
    return {"status": "online", "app": "Pregnancy App API"}

