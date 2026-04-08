FROM python:3.13-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy agent packages
COPY my_first_agent/ ./my_first_agent/
COPY my_config_agent/ ./my_config_agent/

# Cloud Run uses PORT env var (default 8080)
ENV PORT=8080

EXPOSE ${PORT}

# Run ADK API server in production mode
# GOOGLE_API_KEY must be provided via environment variables at runtime
CMD ["sh", "-c", "adk api_server --port ${PORT} ."]
