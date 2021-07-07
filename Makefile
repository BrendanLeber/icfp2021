.PHONY: lint
lint:
	poetry run flake8 .
	poetry run mypy --pretty .


.PHONY: format
format:
	poetry run black .
	poetry run isort .


.PHONY: test
test:
	poetry run pytest --cov=aoclib .


.PHONY: report
report:
	poetry run pytest --cov=aoclib --cov-report html
	xdg-open htmlcov/index.html


.PHONY: clean
clean:
	find . -type d -name __pycache__ -exec rm -rf {} \;
	rm .coverage
	rm -rf htmlcov
	rm -rf .mypy_cache
	rm -rf .pytest_cache
