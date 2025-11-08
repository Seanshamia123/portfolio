import os
from pathlib import Path


class Config:
    """Configure the application database with sensible fallbacks."""

    _database_url = os.getenv("DATABASE_URL")

    if not _database_url:
        mysql_user = os.getenv("MYSQL_USER")
        mysql_password = os.getenv("MYSQL_PASSWORD")
        mysql_db = os.getenv("MYSQL_DB")

        if mysql_user and mysql_password and mysql_db:
            mysql_host = os.getenv("MYSQL_HOST", "localhost")
            mysql_port = os.getenv("MYSQL_PORT", "3306")
            _database_url = (
                f"mysql+pymysql://{mysql_user}:{mysql_password}"
                f"@{mysql_host}:{mysql_port}/{mysql_db}"
            )
        else:
            sqlite_path = Path(__file__).resolve().parent / "portfolio.db"
            _database_url = f"sqlite:///{sqlite_path}"

    SQLALCHEMY_DATABASE_URI = _database_url
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = os.getenv("JWT_SECRET_KEY", "dev")
    SECRET_KEY = os.getenv("SECRET_KEY", "dev-secret-key")
