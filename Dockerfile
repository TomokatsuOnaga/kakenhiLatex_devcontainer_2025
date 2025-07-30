FROM texlive/texlive:latest

# zsh + oh-my-zsh + git をインストール
RUN apt-get update && apt-get install -y zsh curl \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && chsh -s $(which zsh) \
    && echo 'export SHELL=$(which zsh)' >> /etc/zsh/zprofile

ENV TZ=Asia/Tokyo

# 日本のタイムゾーンを設定
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# less, gh のインストール
RUN apt-get update && apt-get install -y \
    less \
    gh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*