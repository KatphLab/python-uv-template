install:
	uv sync --all-groups
	uv run pre-commit install
	uv run pre-commit autoupdate

qa:
	just lint .
