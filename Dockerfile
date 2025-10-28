FROM agrigorev/zoomcamp-model:2025

WORKDIR /code

# Copy pyproject.toml (and uv.lock if you have it)
COPY pyproject.toml .

# Install uv and dependencies
RUN pip install uv
RUN uv pip install --system -r pyproject.toml

# Copy your FastAPI script
COPY serve.py .

# Expose port
EXPOSE 8000

# Run with uvicorn
CMD ["uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8000"]
