# Solvix Hub

A modern Roblox exploit GUI with a clean interface and modular design.

## Features

- Clean, modern UI with animated loading screen
- Modular design for easy feature additions
- GitHub-based loading system using loadstring
- Tab-based interface with draggable window

## Usage

### Quick Start

To use Solvix Hub in your game, simply run this loadstring:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/SolvixHub/main/load.lua"))():Initialize()
```

### Development

1. Fork or clone this repository
2. Modify the modules as needed
3. Host the files on your GitHub repository
4. Update the `config.githubRaw` URL in `load.lua` to point to your repository

## Structure

- `load.lua` - Main loader script that fetches and initializes all modules
- `loadingScreen.lua` - Animated loading screen module
- `mainGUI.lua` - Main GUI interface with tabs

## Adding Features

To add new features:

1. Create a new module file (e.g., `autoFarm.lua`)
2. Add the module name to the `modules` table in `load.lua`
3. Implement your feature in the new module
4. Access the module through the return value of `SolvixHub:Initialize()`

## License

For personal use only. Testing should only be performed on games you own or have permission to test on.
