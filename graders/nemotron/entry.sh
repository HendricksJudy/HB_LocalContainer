#!/usr/bin/env bash
set -e
MODEL_PATH="$1"
PORT="$2"
python -m llama_cpp.server \
  --model "$MODEL_PATH" \
  --port "$PORT" \
  --n-gpu-layers all \
  --max-context-size 131072 \
  --chat-format openai
