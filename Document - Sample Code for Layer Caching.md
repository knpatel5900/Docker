# Dockerfile

    FROM python:3.7-slim-buster
    COPY . .
    RUN pip install --quiet -r requirements.txt
    ENTRYPOINT ["python", "server.py"]
    requirements.txt

    certifi==2018.8.24
    chardet==3.0.4
    Click==7.0
    cycler==0.10.0
    decorator==4.3.0
    defusedxml==0.5.0
    
    
# Build Commands:

    docker build -t without-cache .
    docker build -t with-cache .
