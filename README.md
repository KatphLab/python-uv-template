# Python Project Template

A modern Python project template with best practices for development, featuring UV package management, Pydantic settings, pre-commit hooks, and configurable logging.

## Features

- **Python 3.12+** - Modern Python version with latest features
- **UV Package Manager** - Fast, reliable Python package management
- **Pydantic Settings** - Type-safe configuration from environment variables
- **Pre-commit Hooks** - Automated code quality checks with Ruff
- **MyPy Type Checking** - Strict static type checking with Pydantic plugin
- **Configurable Logging** - Flexible logging with multiple formatters
- **Environment Management** - Dotenv support for local development
- **OpenCode Agent Support** - AI agent guidelines in AGENTS.md
- **Pytest & pytest-cov** - Testing framework with coverage reporting
- **SonarQube Integration** - Code quality and security analysis example
- **Tox Configuration** - Automated testing and coverage collection

## Quick Start

### Prerequisites

- Python 3.12 or higher
- [UV](https://docs.astral.sh/uv/) package manager

### Makefile Commands

```bash
# Install dependencies and set up pre-commit
make install

# Run all quality assurance checks (ruff, mypy, pytest)
make qa
```

### Development

```bash
# Activate the virtual environment
source .venv/bin/activate

# Run your application
python -m your_module
```

## Configuration

### Environment Variables

Copy `.env.example` to `.env` and customize:

```bash
cp .env.example .env
```

Available settings:

| Variable        | Default    | Description                                           |
| --------------- | ---------- | ----------------------------------------------------- |
| `LOG_LEVEL`     | `INFO`     | Logging level (DEBUG, INFO, WARNING, ERROR, CRITICAL) |
| `LOG_FORMATTER` | `standard` | Log format style (`standard` or `detailed`)           |

### Logging

The template includes a flexible logging setup:

```python
from config.logging_config import setup_logging
import logging

# Initialize logging
setup_logging()

# Use the logger
logger = logging.getLogger("app")
logger.info("Application started")
```

**Formatter Options:**

- `standard`: `2024-01-15 10:30:45 [INFO] app: Message`
- `detailed`: `2024-01-15 10:30:45 [INFO] app:42 - Message` (includes line numbers)

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── sonarqube.yml.example  # SonarQube CI workflow example
├── config/
│   ├── env.py              # Pydantic settings configuration
│   └── logging_config.py   # Logging setup
├── .opencode/              # OpenCode agent configuration
│   ├── agents/             # Agent-specific documentation
│   └── opencode.json       # OpenCode settings
├── .env.example            # Example environment variables
├── .gitignore              # Git ignore patterns
├── .pre-commit-config.yaml # Pre-commit hooks configuration
├── .python-version         # Python version specification
├── .vscode/                # VS Code settings
├── AGENTS.md               # AI agent guidelines and best practices
├── Makefile                # Common development tasks
├── mypy.ini                # MyPy type checker configuration
├── pyproject.toml          # Project metadata and dependencies
├── README.md               # This file
├── sonar-project.properties # SonarQube configuration
├── tox.ini                 # Tox test automation configuration
└── uv.lock                 # Locked dependency versions
```

## Development Tools

### Pre-commit Hooks

The following hooks run automatically on commit:

- **Ruff** - Fast Python linter and formatter
- **Check AST** - Validates Python syntax
- **End of File Fixer** - Ensures files end with a newline
- **Trailing Whitespace** - Removes trailing whitespace

Manual run:

```bash
pre-commit run --all-files
```

### Code Quality

```bash
# Format code
ruff format .

# Check and auto-fix issues
ruff check . --fix

# Type check with mypy
mypy .
```

### Makefile Commands

```bash
# Install dependencies and set up pre-commit
make install

# Run all quality assurance checks (ruff, mypy, pytest)
make qa
```

### Testing

This project uses **pytest** with **pytest-cov** for testing and coverage:

```bash
# Run tests
pytest

# Run tests with coverage
pytest --cov

# Generate coverage XML report for SonarQube
pytest --cov --cov-report xml
```

Tests are configured in `pyproject.toml`:

- Test discovery in `tests/` directory
- Test files matching `test_*.py` or `*_test.py`
- Coverage reporting to `coverage.xml`

### SonarQube Integration

This template includes SonarQube configuration for code quality and security analysis:

1. Copy the workflow example to enable:

   ```bash
   mkdir -p .github/workflows
   cp .github/workflows/sonarqube.yml.example .github/workflows/sonarqube.yml
   ```

2. Set up SonarQube Cloud or Server:
   - Create a project and get your token
   - Add repository secrets: `SONAR_TOKEN` and `SONAR_HOST_URL` (for Server)

3. Update `sonar-project.properties`:

   ```properties
   sonar.projectKey=your_project_key
   sonar.python.version=3.12
   sonar.python.coverage.reportPaths=coverage.xml
   sonar.tests=tests
   sonar.sources=src
   ```

4. For GitHub Actions integration, tox is used to run tests and generate coverage reports.

### Type Checking

This project uses **MyPy** with strict settings for static type checking:

```bash
# Run type checker
mypy .

# Check specific file
mypy config/env.py
```

Configuration is in `mypy.ini` with:

- Strict mode enabled
- Pydantic plugin for better model validation
- Unused config warnings
- Import following for dependencies

### OpenCode Agents

This repository includes OpenCode agent configuration:

- **AGENTS.md** - Comprehensive guidelines for AI agents working on this codebase
- **.opencode/** - OpenCode-specific configuration and agent documentation

See `AGENTS.md` for:

- Project structure and conventions
- UV package management commands
- Code style requirements (PEP 8, PEP 257)
- Testing standards and coverage requirements

## Adding Dependencies

```bash
# Add runtime dependency
uv add package-name

# Add development dependency
uv add --dev package-name

# Add to test group
uv add --group test package-name

# Sync dependencies
uv sync

# Sync with all groups
uv sync --all-groups
```

## Customization

To use this template for your project:

1. **Update `pyproject.toml`**:
   - Change `name` to your project name
   - Update `description`
   - Add your dependencies

2. **Update `.env.example`**:
   - Add your application-specific environment variables

3. **Update `config/env.py`**:
   - Add Pydantic fields for your environment variables

4. **Create your application code**:
   - Add your modules and packages
   - Import and use the settings/logging configuration

## License

[Add your license here]

## Contributing

[Add contribution guidelines here]
