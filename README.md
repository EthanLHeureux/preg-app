# Pregnancy App Backend

This is the FastAPI backend for the Pregnancy App. It connects to MongoDB Atlas.

## Quick Start (First Time Setup)

1. **Clone the repo and enter the folder:**
    cd backend

2. **Vitural enviroment:**
    Create:
        python3 -m venv venv

    Activate:
        source venv/bin/activate

3. **Isntall Dependencies:**
    pip install fastapi uvicorn motor pydantic-settings certifi

4. **IMPORTANT: Fix macOS SSL Certificates (Mac Users Only):**
    Run this in your terminal to allow Python to talk to MongoDB:
        /Applications/Python\ 3.12/Install\ Certificates.command

5. **Ask Dev for DB_Key and store in .env file**

6. **Spin Up to start the app:**
    uvicorn app.main:app --reload
