FROM agrigorev/zoomcamp-model:2025

WORKDIR /code

# Install fastapi and uvicorn directly
RUN pip install fastapi uvicorn pydantic scikit-learn

# Copy your FastAPI script
COPY serve.py .

# Expose port
EXPOSE 8000

# Run with uvicorn
CMD ["python", "-m", "uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8000"]
