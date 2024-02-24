FROM mcr.microsoft.com/vscode/devcontainers/python:3.10
USER vscode
WORKDIR /workspaces
COPY --chown=vscode:vscode . .
RUN sudo apt-get update && \
    sudo apt-get install -y libgl1 libglib2.0-0 && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
EXPOSE 7860
CMD ["bash", "-c", "/workspaces/webui.sh --listen"]
