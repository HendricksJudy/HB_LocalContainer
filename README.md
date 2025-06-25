# HealthBench Local Runner

This repo builds a fully offline HealthBench evaluation stack with local graders and evaluator images.

## Runbook

```bash
# 1. configure secrets
cp .env.example .env && vi .env  # add HF_TOKEN

# 2. build everything
make build

# 3. warm GPUs
overwarm: make up-graders

# 4. run evaluation
make eval MODEL=gpt2-medium

# 5. check results
open results/<timestamp>/index.html
```

Run tests with `make test`.
