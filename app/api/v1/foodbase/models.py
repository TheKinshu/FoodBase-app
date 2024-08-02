from typing import List
from datetime import datetime

from app.common.models import StrictBaseModel


class Category(StrictBaseModel):
    id: int = 0
    name: str = ''


class Store(StrictBaseModel):
    id: int = 0
    name: str = ''
    location: str = ''


class ProductDetails(StrictBaseModel):
    id: int = 0
    name: str = ''
    store_name: str = ''
    category_name: str = ''
    price: float = 0.0
    price_last_updated: datetime = datetime.now()
    amount: str = ''


class GetProductDetailsData(StrictBaseModel):
    products: List[ProductDetails] = []
