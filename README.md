# Song to Tab

A Python project for converting songs to guitar tabs.

## Setup

This project uses `uv` for package management and `ruff` for code formatting and linting.

### Prerequisites

- Python 3.8 or higher
- uv (install with: `curl -LsSf https://astral.sh/uv/install.sh | sh`)

### Installation

1. Clone this repository
2. Install dependencies: `uv sync`
3. Activate the virtual environment: `source .venv/bin/activate` (or `uv shell`)

## Development

This project uses [Just](https://github.com/casey/just) for task automation. Run `just` to see all available commands.

### Quick Commands

- **Setup environment**: `just setup`
- **Format and lint**: `just check`
- **Fix linting issues**: `just fix`
- **Run tests**: `just test`
- **Run the app**: `just run [args]`
- **See project info**: `just info`

### Manual Commands (if you prefer)

- Format code: `uv run ruff format`
- Check linting: `uv run ruff check`
- Fix linting issues: `uv run ruff check --fix`
- Run tests: `uv run pytest`

## Project Structure

```
song_to_tab/
├── src/                 # Source code
├── tests/              # Test files
├── docs/               # Documentation
├── pyproject.toml      # Project configuration
└── README.md           # This file
```