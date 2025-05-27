# Start with a minimal Ubuntu base image
FROM ubuntu:22.04

# Install build dependencies and tools
RUN apt update && apt install -y \
    curl wget git tar gzip \
    unzip xz-utils \
    python3 python3-pip \
    nodejs npm \
    ripgrep fd-find \
    libstdc++6 \
    && apt clean

# Download and install the latest Neovim release (Linux 64-bit tarball)
RUN curl -L https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz \
    -o /tmp/nvim.tar.gz \
 && tar xzf /tmp/nvim.tar.gz -C /opt \
 && ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim \
 && rm /tmp/nvim.tar.gz

# Clone Neovim config
RUN git clone https://github.com/jrt-ops/nvim-dotfiles.git ~/.config/nvim

# Run Neovim in headless mode to install plugins
RUN nvim --headless "+Lazy! restore" +qa

# Set the default command
CMD ["nvim"]
