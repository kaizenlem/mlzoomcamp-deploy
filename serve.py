import pickle
from fastapi import FastAPI
from pydantic import BaseModel

class Client(BaseModel):
    lead_source: str
    number_of_courses_viewed: int
    annual_income: float

# Load the pipeline
# with open("pipeline_v1.bin", "rb") as f_in:
#     pipeline = pickle.load(f_in)



with open("pipeline_v2.bin", "rb") as f_in:
    pipeline = pickle.load(f_in)




app = FastAPI()

@app.post("/predict")
def predict(client: Client):
    X = client.dict()
    prob = pipeline.predict_proba([X])[0, 1]
    return {"probability": prob}
