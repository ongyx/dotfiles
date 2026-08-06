#!/usr/bin/python
import os
from pathlib import Path

PWSH_PROFILE = "Microsoft.PowerShell_profile.ps1"
WT_PACKAGE = "Microsoft.WindowsTerminal_8wekyb3d8bbwe"


def get_links() -> dict[str, Path]:
    match os.name:
        case "nt":
            home = Path(os.environ["USERPROFILE"])
            local_app_data = Path(os.environ["LOCALAPPDATA"])
            roaming_app_data = Path(os.environ["APPDATA"])
            helix_config = roaming_app_data / "helix"

            return {
                "helix/config.windows.toml": helix_config / "config.toml",
                "helix/languages.toml": helix_config / "languages.toml",
                "helix/plugins/init.scm": helix_config / "init.scm",
                "helix/plugins/helix.scm": helix_config / "helix.scm",
                "helix/snippets": helix_config / "snippets",
                f"pwsh/{PWSH_PROFILE}": home / "Documents/PowerShell" / PWSH_PROFILE,
                "yt-dlp": roaming_app_data / "yt-dlp",
                "wt": local_app_data / "Packages" / WT_PACKAGE / "LocalState",
                ".gitignore_global": home / ".gitignore_global",
            }

        case "posix":
            home = Path(os.environ["HOME"])
            config = home / ".config"
            helix_config = config / "helix"

            return {
                "helix/config.posix.toml": helix_config / "config.toml",
                "helix/languages.toml": helix_config / "languages.toml",
                "helix/plugins/init.scm": helix_config / "init.scm",
                "helix/plugins/helix.scm": helix_config / "helix.scm",
                "helix/snippets": helix_config / "snippets",
                "ghostty": config / "ghostty",
                "yt-dlp": config / "yt-dlp",
                "zsh": config / "zsh",
                ".zshrc": home / ".zshrc",
                ".zshenv": home / ".zshenv",
                ".zprofile": home / ".zprofile",
                ".tmux.conf": home / ".tmux.conf",
                ".gitignore_global": home / ".gitignore_global",
            }

        case _:
            return {}


def main():
    base = Path(__file__).parent.resolve()
    for target, link_path in get_links().items():
        target_path = base / target

        link_path.parent.mkdir(parents=True, exist_ok=True)

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
