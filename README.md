<!--VERSION 1-->

<!-- # Pregnancy App Backend

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
-->


<!--VERSION 2-->
# Pregnancy App 

**A specialized API ecosystem bridging native iOS development with cloud-hosted data management. This backend serves as the single source of truth for pregnancy progression tracking, weekly devotional content, and educational resource delivery.**

-----

## 🌟 Project Overview

### The Problem

The 40-week journey of pregnancy is often accompanied by an overwhelming amount of fragmented information. Expecting parents frequently struggle to find a single, cohesive space that balances physical health tracking with spiritual and emotional wellness. Traditional resources are often either purely clinical or entirely disconnected from the user’s specific timeline.

### Our Solution

This application provides a week-by-week companion experience. By synchronizing a high-performance FastAPI backend with a native Swift interface, we deliver:

  * **Synchronized Tracking:** Real-time profile management that adapts to the user's current week stage of pregnancy.
  * **Holistic Support:** A "Traversable Devotion" system that offers spiritual and mental encouragement tailored to the specific challenges of each week.
  * **Validated Resources:** A curated resource page of educational materials to replace "information overload" with relevant knowledge.

-----

## 🚀 Tech Stack

  * **Framework:** [FastAPI](https://fastapi.tiangolo.com/) (Asynchronous Python)
  * **Database:** [MongoDB Atlas](https://www.mongodb.com/atlas) (NoSQL)
  * **Driver:** [Motor](https://motor.readthedocs.io/) (Async MongoDB driver)
  * **Validation:** [Pydantic v2](https://www.google.com/search?q=https://docs.pydantic.dev/)
  * **Security:** [Pydantic Settings](https://www.google.com/search?q=https://docs.pydantic.dev/latest/usage/pydantic_settings/) for Environment Variable management.

-----

## 🛠️ Getting Started
### Prerequisites
    Python 3.10+
    Pip (Python package manager)
    macOS Users: Ensure your Python SSL certificates are installed (see step 4).

### Installation & Setup
#### Clone the Repository

```bash
    git clone <https://github.com/EthanLHeureux/preg-app>
    cd backend
```


#### Create a Virtual Environment
```Bash
    python3 -m venv venv
    source venv/bin/activate  # macOS/Linux
    venv\Scripts\activate   # Windows
```


#### Install Dependencies

```Bash
    pip install fastapi uvicorn motor pydantic-settings certifi
```


#### Spin Up to start the app

```bash
    uvicorn app.main:app --reload
```


-----

## 🛠️ Environment Configuration

The application uses a modular configuration system to ensure security across different development environments.

### 1\. The .env File

To connect to the database, a `.env` file must be created in the root directory. This file is excluded from version control to protect credentials.

```bash
MONGODB_URI=your_mongodb_atlas_connection_string
DATABASE_NAME=PregnancyApp
```

### 2\. macOS SSL Requirement

Due to specific security protocols on macOS, Python requires an explicit certificate installation to communicate with MongoDB Atlas. This is a one-time setup requirement for the development environment:

```bash
/Applications/Python\ 3.12/Install\ Certificates.command
```

-----

## 📂 Project Architecture

The project utilizes a **Modular Router Pattern** to ensure the codebase remains maintainable, scalable, and friendly to collaborative development.

```text
├── main.py              # Entry point & Router registration
├── database.py          # MongoDB connection logic & Settings
├── models.py            # Pydantic data schemas (Data Validation)
├── security.py          # Authentication utilities and password hashing
├── .env                 # Environment Secrets (Git Ignored)
└── routes/              # Modular API Feature Folders
    ├── __init__.py      # Package initialization
    ├── user_routes.py   # Profile creation & management
    ├── home_routes.py   # Dashboard & Progress data
    ├── devotion_routes.py # Traversable weekly content
    └── resource_routes.py # Static educational content
```

-----

## 🔗 API Reference

The backend exposes several RESTful endpoints designed for consumption by the Swift/iOS frontend.

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `POST` | `/users/profile` | Serializes and saves a new user profile to MongoDB. |
| `GET` | `/home` | Aggregates user progress and daily messages for the dashboard. |
| `GET` | `/devotions/{week}` | Fetches static devotional content indexed by pregnancy week. |
| `GET` | `/resources` | Retrieves a structured list of educational links and articles. |

-----

## 👥 Development Team

  * **Ethan L'Heureux** – Backend Architecture & Database Management
  * **Abraham Gomez** – iOS Integration & UI/UX Design

-----

> **Security Note:** The `MONGODB_URI` and sensitive credentials are managed via environment variables and are not stored in version control. Contact the project leads for access to the development cluster.
