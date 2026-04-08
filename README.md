# ADK Workspace

Google [Agent Development Kit (ADK)](https://google.github.io/adk-docs/) agents for math tutoring with a philosophical twist.

## Agents

- **my_first_agent** — A math tutor agent (`math_tutor_agent`) with a `deep_thought_agent` sub-agent that handles questions whose answer is 42 with philosophical responses.
- **my_config_agent** — A YAML-configured algebra tutor agent.

## Local Development

```bash
# Create and activate virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Copy and configure environment variables
cp .env.example my_first_agent/.env
# Edit my_first_agent/.env and add your GOOGLE_API_KEY

# Run the dev UI
adk web

# Or run a specific agent in the terminal
adk run my_first_agent
```

## Deploy to Google Cloud Run

```bash
# Build the container image
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/adk-agents

# Deploy to Cloud Run with secrets
gcloud run deploy adk-agents \
  --image gcr.io/YOUR_PROJECT_ID/adk-agents \
  --region us-central1 \
  --set-env-vars GOOGLE_GENAI_USE_VERTEXAI=0 \
  --set-secrets GOOGLE_API_KEY=google-api-key:latest \
  --allow-unauthenticated
```

> **Note:** Create the secret first with:
> `echo -n "YOUR_KEY" | gcloud secrets create google-api-key --data-file=-`

## Environment Variables

| Variable | Description |
|----------|-------------|
| `GOOGLE_API_KEY` | API key for Google AI Studio |
| `GOOGLE_GENAI_USE_VERTEXAI` | Set to `1` for Vertex AI, `0` for AI Studio |
