.PHONY: help setup dev test lint format clean docker-up docker-down

help:
	@echo "LifeTwin AI Development Commands"
	@echo "================================="
	@echo "setup        - Install dependencies"
	@echo "dev          - Run development server"
	@echo "test         - Run tests"
	@echo "lint         - Run linters"
	@echo "format       - Format code"
	@echo "clean        - Clean up generated files"
	@echo "docker-up    - Start Docker services"
	@echo "docker-down  - Stop Docker services"

setup:
	pip install -r backend/requirements.txt

dev:
	docker-compose up

test:
	docker-compose exec api pytest backend/tests -v --cov=backend

lint:
	docker-compose exec api flake8 backend
	docker-compose exec api black --check backend
	docker-compose exec api mypy backend --ignore-missing-imports

format:
	docker-compose exec api black backend
	docker-compose exec api isort backend

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	rm -rf .pytest_cache .coverage htmlcov

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down
