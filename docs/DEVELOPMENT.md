# Development Guide

## Getting Started

### Prerequisites
- Docker & Docker Compose
- Python 3.11+
- PostgreSQL 15+
- Redis 7+

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/GSAI-7-9-24/project.git
   cd project
   ```

2. **Create environment file**
   ```bash
   cp .env.example .env
   ```

3. **Start Docker services**
   ```bash
   docker-compose up -d
   ```

4. **Run migrations (if applicable)**
   ```bash
   docker-compose exec api alembic upgrade head
   ```

5. **Access the application**
   - API: http://localhost:8000
   - API Docs: http://localhost:8000/docs
   - Grafana: http://localhost:3000 (admin/admin)
   - Kibana: http://localhost:5601
   - RabbitMQ: http://localhost:15672 (guest/guest)

## Project Structure

```
project/
├── backend/
│   ├── app/
│   │   ├── api/              # API endpoints
│   │   ├── config.py         # Configuration
│   │   ├── database.py       # Database setup
│   │   ├── main.py          # FastAPI app
│   │   └── middleware.py     # Middleware
│   ├── agents/               # Agent implementations
│   ├── database/             # Database migrations
│   ├── tests/                # Test suite
│   ├── Dockerfile
│   └── requirements.txt
├── frontend/
│   ├── web/                  # Web UI (React)
│   └── mobile/               # Mobile app (React Native)
├── infrastructure/
│   └── monitoring/           # Monitoring configs
├── docs/                     # Documentation
└── docker-compose.yml        # Local development setup
```

## Development Workflow

### Code Style

1. **Format code**
   ```bash
   make format
   ```

2. **Lint code**
   ```bash
   make lint
   ```

3. **Run tests**
   ```bash
   make test
   ```

### Adding New Features

1. Create feature branch
   ```bash
   git checkout -b feature/your-feature
   ```

2. Make changes and commit
   ```bash
   git add .
   git commit -m "feat: description of changes"
   ```

3. Push and create pull request
   ```bash
   git push origin feature/your-feature
   ```

### Database Migrations

Create new migration:
```bash
docker-compose exec api alembic revision --autogenerate -m "description"
```

Run migrations:
```bash
docker-compose exec api alembic upgrade head
```

## Debugging

### View logs
```bash
docker-compose logs -f api
```

### Connect to PostgreSQL
```bash
docker-compose exec postgres psql -U lifetwin_user -d lifetwin_db
```

### Redis CLI
```bash
docker-compose exec redis redis-cli
```

## Common Issues

### Port already in use
```bash
# Find and kill process on port
lsof -i :8000
kill -9 <PID>
```

### Database connection failed
```bash
# Check if postgres is running
docker-compose ps

# Restart services
docker-compose restart postgres
```

## Resources

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Redis Documentation](https://redis.io/documentation)
