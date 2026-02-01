# Openclaw-Manager Plugin for DankMaterialShell

**Minimal System Kill Switch for V Assistant.**

Control your [OpenClaw](https://openclaw.ai) instance directly from your desktop bar. Toggle the system ON/OFF with a single click.

![V-Manager Icon](https://img.shields.io/badge/V-Manager-Neon-00ffcc?style=for-the-badge&logo=rocket)

## Features

- **Ultra-Minimal UI**: A clean dot indicator (White/Dim).
- **Hard Kill Switch**: Completely stops the OpenClaw service and kills processes.
- **Telegram Integration**: Sends notifications to your Telegram bot on state change.
- **Systemd Control**: Manages the `openclaw-gateway` user service.

## Installation

### Manual

Clone this repository into your plugins directory:

```bash
mkdir -p ~/.config/DankMaterialShell/plugins
cd ~/.config/DankMaterialShell/plugins
git clone https://github.com/Oki3505F/v-manager-dms.git VManager
dms restart
```

### Configuration

The plugin uses a helper script located at `~/.openclaw/v-toggle.sh`. 
(Note: The current version expects this script to exist. Future versions will bundle the logic).

## Usage

1. Enable the plugin in DMS Settings > Plugins.
2. Add the **V-Manager** widget to your DankBar.
3. Click the dot to toggle system state.

## License

MIT License. See [LICENSE](LICENSE) file.
