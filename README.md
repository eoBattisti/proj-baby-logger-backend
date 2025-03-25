# Baby Logger

This is the backend for the Baby Logger app, a simple app to help you keep track of your baby's sleep, breastfeed, and diapers schedules.

## Technologies
Although the app is simple and also a POC, the following technologies were used:

- Python `3.12`:
    - FastAPI: It`s a modern and easy-to-use framework for building APIs with Python, due to the projects simplicity, it was an easy choice.
    - SQLModel: It`s a library that makes it easy to create and manage database models in Python.
    - Pytest: Most commonly used testing framework in Python.
- Database - `SQLite3` was chosen for its simplicity and due to the project scope didn`t needed a complex database, SQLite3 will handle the needs.
- Cache - `Redis`.
- Docker - `Dockerfile` and `docker-compose.yaml` were used to create a simple containerized application both for local development and production (when we deploy it!).

The structure and architecture of the project was written following the [fastapi-best-practices](https://github.com/zhanymkanov/fastapi-best-practices)
