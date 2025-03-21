#!/bin/sh

# Check if the OLLAMA_LLM_MODELS variable is set
if [ -z "$OLLAMA_LLM_MODELS" ]; then
  echo "Error: OLLAMA_LLM_MODELS environment variable is not set or is empty."
  exit 1
fi

# Check if the OLLAMA_WEBAPI_PORT variable is set
if [ -z "$OLLAMA_BASE_URL" ]; then
  echo "Error: OLLAMA_BASE_URL environment variable is not set or is empty."
  exit 1
fi

# Static wait to ensure the Ollama service is ready
echo "Waiting for 15 seconds to ensure the Ollama service is ready..."
sleep 15

# Begin loading models sequentially
echo "Starting the sequential loading of models..."

# Parse the OLLAMA_LLM_MODELS variable into a list
MODELS=$(echo "$OLLAMA_LLM_MODELS" | tr ',' ' ')

# Loop through each model and pull it sequentially
for MODEL in $MODELS; do
  if [ -n "$MODEL" ]; then
    echo "Pulling model: $MODEL"
    OLLAMA_HOST="${OLLAMA_BASE_URL}" ollama pull "$MODEL" # Use OLLAMA_HOST to access the ollama service over the Docker network
  else
    echo "Warning: Empty or invalid model name found and skipped."
  fi
done

echo "completed"
