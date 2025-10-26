# Song to Tab - Project Commands
# Use `just --list` to see all available commands

# Default recipe (shows help)
default:
    @just --list

# === Development Setup ===

# Install all dependencies and sync the environment
install:
    @echo "Installing dependencies..."
    uv sync

# Set up the development environment (install + pre-commit hooks if any)
setup: install
    @echo "Development environment ready!"

# === Code Quality ===

# Format code with ruff
format:
    @echo "Formatting code..."
    uv run ruff format src/ tests/

# Check code style and linting
lint:
    @echo "Checking code style..."
    uv run ruff check src/ tests/

# Fix auto-fixable linting issues
fix:
    @echo "Fixing linting issues..."
    uv run ruff check --fix src/ tests/

# Run both formatting and linting
check:
    @echo "Formatting code..."
    uv run ruff format src/ tests/
    @echo "Checking code style..."
    uv run ruff check src/ tests/
    @echo "Code quality checks complete!"

# === Testing ===

# Run all tests
test:
    @echo "Running tests..."
    uv run pytest

# Run tests with coverage report
test-cov:
    @echo "Running tests with coverage..."
    uv run pytest --cov=src --cov-report=term-missing --cov-report=html

# Run tests in watch mode (requires pytest-watch)
test-watch:
    @echo "Running tests in watch mode..."
    uv run ptw

# === Running the Application ===

# Run the main application
run *ARGS:
    @echo "Running song-to-tab..."
    uv run python -m song_to_tab {{ARGS}}

# Run with sample arguments (you can modify this)
demo:
    @echo "Running demo..."
    uv run python -m song_to_tab --help

# === Project Management ===

# Show project info
info:
    @echo "Project Information:"
    @echo "Name: song-to-tab"
    @echo "Python version: $(uv run python --version)"
    @echo "UV version: $(uv --version)"
    @echo "Project root: $(pwd)"

# List all installed packages
deps:
    @echo "Installed packages:"
    uv tree

# Update all dependencies
update:
    @echo "Updating dependencies..."
    uv sync --upgrade

# === Cleaning ===

# Clean build artifacts, cache files, etc.
clean:
    @echo "Cleaning up..."
    find . -type f -name "*.pyc" -delete
    find . -type d -name "__pycache__" -exec rm -rf {} +
    find . -type d -name "*.egg-info" -exec rm -rf {} +
    find . -type d -name ".pytest_cache" -exec rm -rf {} +
    find . -type d -name ".coverage" -delete
    find . -type d -name "htmlcov" -exec rm -rf {} +
    rm -rf build/ dist/

# === Building and Publishing ===

# Build the package
build:
    @echo "Building package..."
    uv build

# Build and install the package locally
install-local: build
    @echo "Installing locally..."
    uv pip install dist/*.whl --force-reinstall

# === Documentation ===

# Serve docs locally (if you add docs later)
docs-serve:
    @echo "Serving documentation..."
    @echo "Add your documentation server command here"

# === Git Helpers ===

# Show git status and recent commits
status:
    @echo "Git Status:"
    git status --short
    @echo ""
    @echo "Recent commits:"
    git log --oneline -5

# Quick commit with message
commit MESSAGE:
    git add .
    git commit -m "{{MESSAGE}}"

# === Advanced ===

# Profile the application (requires line_profiler or similar)
profile *ARGS:
    @echo "Profiling application..."
    uv run python -m cProfile -m song_to_tab {{ARGS}}

# Check for security vulnerabilities (requires safety)
security:
    @echo "Checking for security vulnerabilities..."
    uv run pip-audit

# Run all quality checks (comprehensive check before commit)
ci:
    @echo "Formatting code..."
    uv run ruff format src/ tests/
    @echo "Checking code style..."
    uv run ruff check src/ tests/
    @echo "Running tests..."
    uv run pytest
    @echo "All CI checks passed!"