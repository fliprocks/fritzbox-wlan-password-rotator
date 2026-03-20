FROM python:3.10.20-slim-trixie

ENV PYTHONUNBUFFERED=1

WORKDIR /app

ARG VERSION=Unknown version

ENV VERSION=${VERSION}

RUN echo "$VERSION" > /app/version.txt

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "-c", "gunicorn.conf.py", "main:app"]
