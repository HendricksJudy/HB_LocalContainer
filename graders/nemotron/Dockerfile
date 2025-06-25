FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04
ARG HF_TOKEN
ENV LLAMA_CUBLAS=1 FORCE_CMAKE=1
RUN apt-get update && apt-get install -y python3 python3-pip git curl build-essential
RUN pip install --no-cache-dir "llama-cpp-python[cuda]==0.2.28"
ENV HF_HOME=/models \
    MODEL_REPO=lmstudio-community/Llama-3_1-Nemotron-Ultra-253B-v1-GGUF
RUN huggingface-cli login --token $HF_TOKEN && \
    huggingface-cli download $MODEL_REPO --local-dir /models/nemotron \
        --include "*Q8_0.gguf"
COPY entry.sh /entry.sh
CMD ["/entry.sh", "/models/nemotron/nemotron-ultra-253b-v1.Q8_0.gguf", "8001"]
