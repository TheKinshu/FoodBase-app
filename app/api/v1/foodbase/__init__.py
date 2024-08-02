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

from app.api.v1.foodbase.models import GetProductDetailsData, ProductDetails
from app.common.models import products, stores, categories
from app.core.db import queries

logger: Final = get_logger()

router = APIRouter()


@router.get("/find-products")
async def find_products(request: Request) -> GetProductDetailsData:
    db: Session = request.state.db

    # Get data from database
    query = select(
        products.c.id, products.c.name, stores.c.name.label('store_name'), categories.c.name.label('category_name'),
        products.c.price, products.c.price_last_updated, products.c.amount
    ).join(
        stores, products.c.store_id == stores.c.id
    ).join(
        categories, products.c.category_id == categories.c.id
    )
    products_result = db.execute(query).mappings().all()
    products_ = [ProductDetails(**product) for product in products_result]
    return GetProductDetailsData(products=products_)


@router.get("/add-product")
async def add_products(request: Request, name: str, price: float,
                       amount: str, store_id: int, category_id: int) -> dict:
    return {"message": f"Hello {name}"}
