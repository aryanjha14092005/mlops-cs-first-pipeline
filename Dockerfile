#pull the python image from docker hub
#use a lightweight python image
FROM python:3.14-slim
#set the working directory in the container
WORKDIR /app
#copy the dependencies file to the working directory
COPY requirements.txt .
#install dependencies
RUN pip install -r requirements.txt

#copy application code and saved model inside/app
COPY . .
#Document the port used by the FastAPI app
EXPOSE 8000
#start the api server when container is ready
#0.0.0.0 -allows connections through the container's IP address
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


