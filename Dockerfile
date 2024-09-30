# Step 1: Build the React frontend
FROM node:18-alpine AS frontend-builder
WORKDIR /app
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Step 2: Build the FastAPI backend
FROM python:3.13.0rc2-slim AS backend
WORKDIR /app
COPY backend .
RUN pip install --no-cache-dir -r requirements.txt
COPY --from=frontend-builder /app/build ./frontend/build

# Step 3: Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
