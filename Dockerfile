FROM python:3.9
RUN apt-get update && apt-get install -y --no-install-recommends libgl1 && rm -rf /var/lib/apt/lists/*
# download this https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
# copy model to avoid unnecessary download
RUN wget https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install onnxruntime


COPY . .

EXPOSE 5100

CMD ["python", "app.py"]
