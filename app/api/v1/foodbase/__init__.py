import os
import base64

from asgi_correlation_id import correlation_id
from typing import Final, Annotated
# FastAPI imports
from fastapi import APIRouter, FastAPI, Form, File, UploadFile, Request, Security, HTTPException, status
from fastapi.security import SecurityScopes
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse, Response
from fastapi.openapi.utils import get_openapi
from starlette.responses import JSONResponse
# SQLAlchemy imports
from sqlalchemy import select, func, desc
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.sql.functions import coalesce
from sqlalchemy.orm import Session, aliased

from structlog import get_logger

logger: Final = get_logger()

router = APIRouter()


@router.get("/find-products")
async def find_products(request: Request, body):
    db: Session = request.state.db

    # Get data from database
    # query = select([Product]).where(Product.name == body['name'])
    return {"message": "Hello World"}


@router.get("/add-product")
async def add_products(name: str):
    return {"message": f"Hello {name}"}
