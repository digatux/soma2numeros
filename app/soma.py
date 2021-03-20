import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel


class SomaRequest(BaseModel):
    num1: int
    num2: int



app = FastAPI()

@app.get("/")
def hellowork():
    return {
        "hello": "world"
    }

@app.post("/soma/")
async def soma(num_request: SomaRequest):
    numero1 = num_request.num1
    numero2 = num_request.num2
    soma = numero1 + numero2
    return {
        "A soma é": soma
    }


if __name__ == "__main__":
    uvicorn.run("soma:app", host="0.0.0.0", port=8000, log_level="debug")