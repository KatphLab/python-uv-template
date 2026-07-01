set shell := ["bash", "-euc"]

default:
    just --list

lint *paths:
    paths="{{paths}}"; \
    if [ -z "$paths" ]; then paths="."; fi; \
    echo "Running ruff on: $paths"; \
    uv run ruff check $paths --fix; \
    echo "Running semgrep on: $paths"; \
    uv run semgrep scan \
        --quiet \
        --error \
        --disable-version-check \
        --metrics=off \
        --config semgrep-rules.yml \
        $paths; \
    echo "Running mypy on: $paths"; \
    uv run mypy $paths; \
    echo "Running duplication check on: $paths"; \
    npx jscpd $paths
