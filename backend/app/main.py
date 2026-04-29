from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import user_routes, home_routes, devotions_routes, resources_routes


app = FastAPI(title="Pregnancy App API")

# Routing to page specific files.
app.include_router(user_routes.router)
app.include_router(home_routes.router)
app.include_router(devotions_routes.router)
app.include_router(resources_routes.router)

# CORS setup only for development and web testing.
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
