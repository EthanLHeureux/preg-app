from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
#from contextlib import asynccontextmanager
from app.routes import user_routes, home_routes, devotions_routes, resources_routes
#from database import client


app = FastAPI(title="Pregnancy App API")

# ---CORS Setup for Xcode---
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ---Routers---
app.include_router(user_routes.router)
app.include_router(home_routes.router)
app.include_router(devotions_routes.router)
app.include_router(resources_routes.router)
