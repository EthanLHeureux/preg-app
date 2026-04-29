import pytest
from httpx import AsyncClient, ASGITransport
from app.main import app

@pytest.mark.anyio
async def test_duplicate_email_registration():

    # Use of ASGITransport to talk to FastAPI w/o need of running the server.
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as ac:
        
        user_payload = {
            "email": "duplicate@example.com",
            "password": "password123",
            "name": "Test User",
            "current_week": 13,
            "dueDate": "2026-12-25T00:00:00Z"
        }

        # First attempt: Ensure the email exists in DB.
        await ac.post("/users", json=user_payload)

        # Second attempt: Try the exact same email.
        response = await ac.post("/users", json=user_payload)

        # Outcome.
        assert response.status_code == 400
        assert response.json()["detail"] == "Email already registered"