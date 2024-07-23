from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from fastapi.openapi.utils import get_openapi

from app.api.v1.foodbase import router as foodbase_router
from app.middleware import TransactionMiddleware

app = FastAPI()

app.add_middleware(TransactionMiddleware)

app.include_router(foodbase_router, prefix="/api/v1/foodbase", tags=["foodbase"])


@app.get("/")
async def redirect_to_swagger():
    return RedirectResponse(url="/docs")


def custom_openapi():
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = get_openapi(
        title="Foodbase API",
        version="1.0.0",
        summary="Backend api schema for Food base application",
        description="Built with **OpenAPI** 3.0",
        routes=app.routes,
    )

    app.openapi_schema = openapi_schema
    return app.openapi_schema


app.openapi = custom_openapi
if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
