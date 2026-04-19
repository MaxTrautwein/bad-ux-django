FROM python:3.14-alpine

WORKDIR /app

COPY src/requierments.txt requierments.txt

RUN pip install -r requierments.txt
RUN rm requierments.txt

RUN pip install uvicorn

COPY src/ .

# Configure it
ENV DEBUG="False"
ENV ALLOWED_HOSTS="localhost"
ENV ADMIN_ENABLED="False"

CMD ["python", "-m", "uvicorn", "badux.asgi:application", "--host", "0.0.0.0", "--port", "8080"]