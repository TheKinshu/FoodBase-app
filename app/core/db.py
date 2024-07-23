import asyncio
import threading
from typing import Final

import pugsql
import os
from alembic import command
from alembic.config import Config
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from structlog import get_logger

from app import root_path
# from app import root_path
from app.core.config import settings

db_url = f"postgresql+psycopg://{settings.postgres.username}:{settings.postgres.password}@{settings.postgres.server_name}:{settings.postgres.port_number}/{settings.postgres.database_name}"

logger: Final = get_logger()


def alembic_upgrade():
    alembic_cfg = Config("alembic.ini")
    try:
        with queries.transaction() as session:
            alembic_cfg.attributes['connection'] = session.connection
            command.upgrade(alembic_cfg, "head")
            logger.info("Alembic upgrade completed successfully")
    except Exception as e:
        logger.error(f"Alembic upgrade failed: {e}")


async def run_migrations():
    loop = asyncio.get_event_loop()
    await loop.run_in_executor(None, alembic_upgrade)


logger.info("Initializing *db* module", settings=settings.postgres)
queries = pugsql.module(f"{root_path}/resources/sql/queries")
engine = create_engine(db_url)
queries.setengine(engine)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session_context = threading.local()

try:
    queries.engine.connect().close()
    logger.info("*db* module initialized")
except Exception as e:
    logger.error("Failed to initialize *db* module", exc_info=True)
    raise SystemExit(e)
