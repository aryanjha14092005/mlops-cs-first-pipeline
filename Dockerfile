# Pull the Python image from Docker Hub.
# Use a lightweight Python image.
FROM python:3.14-slim
# Set the working directory in the container.
WORKDIR /app
# Copy the dependencies file to the working directory.
COPY requirements.txt .
# Install dependencies.
RUN pip install -r requirements.txt

# Copy application code and the saved model into /app.
COPY . .
# Document the port used by the FastAPI app.
EXPOSE 8000
# Start the API server when the container is ready.
# 0.0.0.0 allows connections through the container's IP address.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


