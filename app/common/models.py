from pydantic import BaseModel, ConfigDict
from sqlalchemy import Table, Column, Integer, String, MetaData, ForeignKey
from sqlalchemy.dialects.mysql import BIGINT, TEXT, REAL, TIMESTAMP, VARCHAR

metadata = MetaData()


class StrictBaseModel(BaseModel):
    model_config = ConfigDict(extra="forbid")


products = Table(
    'products', metadata,
    Column('id', BIGINT, primary_key=True),
    Column('name', VARCHAR(255), nullable=False),
    Column('store_id', BIGINT, ForeignKey('stores.id'), nullable=False),
    Column('category_id', BIGINT, ForeignKey('categories.id'), nullable=False),
    Column('price', REAL, nullable=False),
    Column('price_last_updated', TIMESTAMP, nullable=False),
    Column('amount', VARCHAR(255), nullable=False),

)

stores = Table(
    'stores', metadata,
    Column('id', BIGINT, primary_key=True),
    Column('name', VARCHAR(255), nullable=False),
    Column('location', VARCHAR(255), nullable=False),
)

categories = Table(
    'categories', metadata,
    Column('id', BIGINT, primary_key=True),
    Column('name', VARCHAR(255), nullable=False),
)
