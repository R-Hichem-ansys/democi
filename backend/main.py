from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # You can specify allowed origins instead of "*"
    allow_credentials=True,
    allow_methods=["*"],  # You can restrict allowed methods if necessary
    allow_headers=["*"],  # You can restrict allowed headers if necessary
)

# Serve the built React app
app.mount("/static", StaticFiles(directory="frontend/build/static"), name="static")

@app.get("/")
def read_root():
    return FileResponse("frontend/build/index.html")

@app.get("/todos")
def get_todos():
    todos = [
        {"id": 1, "task": "Buy groceries", "completed": False},
        {"id": 2, "task": "Clean the house", "completed": True},
        {"id": 3, "task": "Finish project", "completed": False},
    ]
    return {"todos": todos}
