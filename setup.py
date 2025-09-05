#!/usr/bin/python
import pathlib

LINKS = {
    "ghostty": "~/.config/ghostty",
    "helix": "~/.config/helix",
    "yt-dlp": "~/.config/yt-dlp",
    "zsh": "~/.config/zsh",
    ".zshrc": "~/.zshrc",
    ".zshenv": "~/.zshenv",
    ".tmux.conf": "~/.tmux.conf"
}

def main():
    for target, link in LINKS.items():
        target_path = pathlib.Path(target).absolute()
        link_path = pathlib.Path(link).expanduser()

        if link_path.is_symlink():
            print(f"Removing symlink at {link_path}")
            link_path.unlink()
        elif link_path.exists():
            # Don't touch existing file/dir.
            print(f"Skipping {link_path} - not a symlink")
            continue

        print(f"Symlinking {target_path} to {link_path}")
        link_path.symlink_to(target_path, target_is_directory=True)


if __name__ == "__main__":
    main()
