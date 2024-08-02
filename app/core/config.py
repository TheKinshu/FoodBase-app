from pydantic.v1 import BaseSettings
from pydantic_settings import SettingsConfigDict

class PostgresSettings(BaseSettings):
    server_name: str = 'localhost'
    port_number: int = 5432
    username: str = 'test'
    password: str = 'test'
    database_name: str = 'test'

class Settings(BaseSettings):
    app_name: str = "Drawtool Backend"
    postgres: PostgresSettings = PostgresSettings(username="test")
    openapi: str = ''
    openai_api_max_connection_timeout: int = 20
    aws_region: str = 'us-west-2'
    aws_access_key_id: str = 'test'
    aws_secret_access_key: str = 'test'
    model_config = SettingsConfigDict(env_nested_delimiter='__')


settings = Settings()
