FROM python:3.7-alpine
WORKDIR /app
COPY . /app
CMD ["python3","hello.py"]  
