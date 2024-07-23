from typing import Final

from fastapi import Request

from starlette.middleware.base import BaseHTTPMiddleware
from structlog import get_logger

from app.core.db import SessionLocal

logger: Final = get_logger()


class TransactionMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        logger.info("TransactionMiddleware")

        try:
            # Starts session
            request.state.db = SessionLocal()
            response = await call_next(request)
            pass

        except Exception as e:
            logger.error("Error in TransactionMiddleware: " + str(e))
            raise e

        response = await call_next(request)
        return response
