#!/usr/bin/python
import os
from pathlib import Path


def get_links() -> dict[str, Path]:
    match os.name:
        case "nt":
            local_app_data = os.environ["LOCALAPPDATA"]
            roaming_app_data = os.environ["APPDATA"]

            return {
                "helix": Path(rf"{roaming_app_data}\helix"),
                r"helix\config.windows.toml": Path(r"helix\config.toml").absolute(),
                "yt-dlp": Path(rf"{roaming_app_data}\yt-dlp"),
                "wt": Path(
                    rf"{local_app_data}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
                ),
            }

        case "posix":
            home = os.environ["HOME"]

            return {
                "ghostty": Path(f"{home}/.config/ghostty"),
                "helix": Path(f"{home}/.config/helix"),
                r"helix/config.posix.toml": Path(r"helix/config.toml").absolute(),
                "yt-dlp": Path(f"{home}/.config/yt-dlp"),
                "zsh": Path(f"{home}/.config/zsh"),
                ".zshrc": Path(f"{home}/.zshrc"),
                ".zshenv": Path(f"{home}/.zshenv"),
                ".tmux.conf": Path(f"{home}/.tmux.conf"),
            }

        case _:
            return {}


def main():
    for target, link_path in get_links().items():
        target_path = Path(target).absolute()

        if link_path.is_symlink():
            print(f"Removing symlink at {link_path}")
            link_path.unlink()
        elif link_path.exists():
            # Don't touch existing file/dir.
            print(f"Skipping {link_path} - not a symlink")
            continue

        print(f"Symlinking {target_path} to {link_path}")
        link_path.symlink_to(target_path)


if __name__ == "__main__":
    main()
