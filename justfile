set shell := ["bash", "-euc"]

default:
    just --list

install:
    uv sync --all-groups
    uv run pre-commit install
    uv run pre-commit autoupdate

qa:
    just lint src/
    just lint tests/

test:
    uv run pytest tests/

test-coverage:
    uv run tox

coverage-report:
    uv run coverage report --show-missing

lint +paths:
    echo "Running ruff on: {{ paths }}"
    uv run ruff format {{ paths }}
    uv run ruff check {{ paths }} --fix
    just _python-checks "{{ paths }}"

lint-check +paths:
    echo "Checking ruff formatting on: {{ paths }}"
    uv run ruff format --check {{ paths }}
    uv run ruff check {{ paths }}
    just _python-checks "{{ paths }}"

_python-checks paths:
    just _semgrep "{{ paths }}"
    @echo "Running mypy on: {{ paths }}"
    uv run mypy {{ paths }}
    @echo "Running duplication check on: {{ paths }}"
    npx jscpd --ignore "**/*.cpp,**/*.hpp,**/*.txt,**/*.md" {{ paths }}

_semgrep paths:
    @echo "Running semgrep on: {{ paths }}"
    uv run semgrep scan \
        --quiet \
        --error \
        --disable-version-check \
        --metrics=off \
        --config semgrep-rules.yml \
        {{ paths }}
