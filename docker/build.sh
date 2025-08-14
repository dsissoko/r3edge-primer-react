#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# Get the directory where the script is located, which is /path/to/project/docker
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# The project root is one level up from the script directory
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# The .env file is in the same directory as the script
ENV_FILE="$SCRIPT_DIR/.env"

# Load environment variables from .env file if it exists
if [ -f "$ENV_FILE" ]; then
  # Use grep to filter out comments and xargs to export the variables
  export $(grep -v '^#' "$ENV_FILE" | xargs)
fi

# Check if DOCKER_USERNAME is set or is still the default placeholder
if [ -z "${DOCKER_USERNAME}" ] || [ "${DOCKER_USERNAME}" = "your-docker-hub-username" ]; then
    echo "Error: DOCKER_USERNAME is not set or is still the default value."
    echo "Please copy 'docker/.env.example' to 'docker/.env' and set your Docker Hub username."
    exit 1
fi

# Define the full image tag
IMAGE_TAG="${DOCKER_USERNAME}/${IMAGE_NAME}:latest"

# Build the Docker image.
# The build context is the project root, which allows Docker to find all necessary files.
echo "Building Docker image: ${IMAGE_TAG}"
docker build -f "${SCRIPT_DIR}/Dockerfile" -t "${IMAGE_TAG}" "${PROJECT_ROOT}"

echo "Build complete."

# Ask the user if they want to push the image to Docker Hub
# The -n 1 flag reads a single character, and -r prevents backslash interpretation.
read -p "Do you want to push this image to Docker Hub? (y/n) " -n 1 -r
echo # Move to a new line for cleaner output

if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Pushing image to Docker Hub..."
  docker push "${IMAGE_TAG}"
  echo "Push complete."
else
  echo "Skipping push."
fi
