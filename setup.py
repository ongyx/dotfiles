#!/usr/bin/python
import os
from pathlib import Path


PWSH_PROFILE = "Microsoft.PowerShell_profile.ps1"
WT_PACKAGE = "Microsoft.WindowsTerminal_8wekyb3d8bbwe"


def get_links() -> dict[str, Path]:
    match os.name:
        case "nt":
            home = os.environ["USERPROFILE"]
            local_app_data = os.environ["LOCALAPPDATA"]
            roaming_app_data = os.environ["APPDATA"]

            return {
                "helix": Path(rf"{roaming_app_data}\helix"),
                r"helix\config.windows.toml": Path(r"helix\config.toml").absolute(),
                rf"pwsh\{PWSH_PROFILE}": Path(
                    rf"{home}\Documents\PowerShell\{PWSH_PROFILE}"
                ),
                "yt-dlp": Path(rf"{roaming_app_data}\yt-dlp"),
                "wt": Path(rf"{local_app_data}\Packages\{WT_PACKAGE}\LocalState"),
                ".gitignore_global": Path(rf"{home}\.gitignore_global"),
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
                ".gitignore_global": Path(f"{home}/.gitignore_global"),
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
