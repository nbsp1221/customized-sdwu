FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-20.04
USER vscode
RUN sudo mkdir /workspace && \
    sudo chown vscode:vscode /workspace
WORKDIR /workspace

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    sudo apt-get update && \
    sudo apt-get install -y gh

# Install Python
RUN sudo apt-get install -y python3 python3-pip python3-venv && \
    pip3 install --upgrade pip

# Install dependencies
RUN sudo apt-get install -y libgl1

# Install Stable Diffusion Web UI
COPY . /workspace

# Optimize
RUN sudo apt-get upgrade -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean -y && \
    sudo rm -rf /var/lib/apt/lists/*

# Run
EXPOSE 7860
CMD ["bash", "-c", "/workspace/webui.sh --listen"]
