
# XFCE4 Desktop for Termux

Run a stable XFCE4 desktop on Android devices with VSCode support.

## Requirements
- Android 9+
- 4GB+ RAM
- Termux (from F-Droid)

## Installation

1. **Install Termux**  
   Get it from [F-Droid](https://f-droid.org/en/packages/com.termux/)

2. **Run Setup**  
   ```bash
   curl -sL https://raw.githubusercontent.com/yourusername/termux-xfce4-setup/main/termux-setup.sh | bash
   ```

3. **Install Termux-X11 APK**  
   Download from [GitHub Releases](https://github.com/termux/termux-x11/releases)

## Usage

- **Start Desktop**:
  ```bash
  termux-wake-lock
  ./start-xfce.sh
  ```
  
- **Stop Desktop**:
  ```bash
  ./stop-xfce.sh
  termux-wake-unlock
  ```

## Features
- XFCE4 with hardware acceleration
- Auto-start DBus/elogind
- Compositing disabled for stability
- Firefox ESR preinstalled

## Troubleshooting
- **Crashes**: Run `termux-wake-lock` before starting
- **Black Screen**: Force-stop Termux-X11 app
- **Low RAM**: Close background Android apps
