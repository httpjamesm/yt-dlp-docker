# yt-dlp Docker

Lightweight, sandboxed yt-dlp container based on Alpine Linux.

## Build

```sh
docker build -t yt-dlp .
```

## Usage

Downloads go to your current directory:

```sh
docker run --rm -v "$(pwd):/downloads" yt-dlp <URL>
```

Pass any yt-dlp flags as normal:

```sh
# Download best audio as mp3
docker run --rm -v "$(pwd):/downloads" yt-dlp -x --audio-format mp3 <URL>

# List available formats
docker run --rm yt-dlp -F <URL>

# Download specific format
docker run --rm -v "$(pwd):/downloads" yt-dlp -f bestvideo+bestaudio <URL>
```

## Optional: shell alias

Add to your shell config (`~/.bashrc`, `~/.zshrc`, `config.fish`, etc.):

```sh
# bash/zsh
alias yt-dlp='docker run --rm -v "$(pwd):/downloads" yt-dlp'

# fish
alias yt-dlp='docker run --rm -v (pwd):/downloads yt-dlp'
```

Then use it exactly like the native tool:

```sh
yt-dlp <URL>
```

## Security

- Runs as non-root user (`ytdlp`, uid 1000)
- No network access beyond what Docker allows
- Only `/downloads` is mounted — no access to the rest of your filesystem
- Read-only root filesystem compatible (add `--read-only --tmpfs /tmp` if desired)
