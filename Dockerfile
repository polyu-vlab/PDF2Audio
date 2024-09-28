
# Original repo uses python 3.9
FROM python:3.9-slim

# NO PYC FILES
ENV PYTHONDONTWRITEBYTECODE=1

# NO BUFFER, OUTPUT TO TERMINAL
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends build-essential

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Gradio port
EXPOSE 7860

ENV OPENAI_API_KEY=""

CMD ["python", "app.py"]