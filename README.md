# Object-Detection-API

## Overview
This project is a Flask REST API that performs object detection on uploaded images.
It uses a Faster R-CNN (ResNet50-FPN) model and returns detected objects as JSON
(labels, confidence scores, and bounding boxes).

## Features
- Upload an image and get detection results in JSON
- Confidence filtering (default: score > 0.5)
- Docker support (in progress)

##JSON EXAMPLE
[
  {"label": "person", "score": 0.92, "box": [x1, y1, x2, y2]},
  {"label": "car", "score": 0.81, "box": [x1, y1, x2, y2]}
]

## Tech Stack
- Python, Flask
- PyTorch, Torchvision
- Docker (deployment in progress)

## API Endpoint
### POST /predict
Upload an image using form-data key `file`.

## Model Weights
The trained Faster R-CNN model file (`fasterrcnn_model.pkl`) is not included
in this repository due to GitHub file size limits.


**Example (curl):**
```bash
curl -X POST http://127.0.0.1:8080/predict \
  -F "file=@your_image.jpg"
