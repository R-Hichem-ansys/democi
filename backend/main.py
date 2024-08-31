from fastapi import FastAPI

app = FastAPI()

@app.get("/todos")
def get_todos():
    todos = [
        {"id": 1, "task": "Buy groceries", "completed": False},
        {"id": 2, "task": "Clean the house", "completed": True},
        {"id": 3, "task": "Finish project", "completed": False},
    ]
    return {"todos": todos}
