FROM python:3.11-slim
ARG SIMPLE_EVALS_COMMIT=1b9e4ac
WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/openai/simple-evals . && \
    git checkout ${SIMPLE_EVALS_COMMIT}

COPY requirements.txt /tmp/req.txt
RUN pip install --no-cache-dir -r /tmp/req.txt

COPY patch_healthbench.diff /patch.diff
RUN git apply /patch.diff

RUN python -m simple_evals.simple_evals --eval=healthbench --list_only && \
    sha256sum evaluations/healthbench*.jsonl > /datasets.sha256

ENTRYPOINT ["python", "-m", "simple_evals.simple_evals"]
