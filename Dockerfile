FROM python:3.7-alpine
WORKDIR /app
COPY . /app
RUN pip install redis 
RUN pip install tornado
CMD ["python3","hello.py"]  
