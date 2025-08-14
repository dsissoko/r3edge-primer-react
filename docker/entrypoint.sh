#!/bin/sh
# This script is executed when the Docker container starts.

# The placeholder in your React code that will be replaced.
# Example usage in React: const apiUrl = "##BACKEND_API_URL##";
PLACEHOLDER="##BACKEND_API_URL##"

# The actual URL from the environment variable, with a default value.
# The ":-" syntax means: use $BACKEND_API_URL if it's set, otherwise use "http://localhost:8080/api".
TARGET_URL=${BACKEND_API_URL:-"http://localhost:8080/api"}

echo "Setting API URL to: ${TARGET_URL}"

# Find all JavaScript files in the build output directory.
# The `-type f -name '*.js'` ensures we only target files.
find /usr/share/nginx/html -type f -name '*.js' | while read file; do
  # Use sed to replace the placeholder with the target URL.
  # The `g` flag ensures all occurrences in a file are replaced.
  # The `i` flag edits the file in-place.
  # Using a different separator `|` for sed avoids issues if the URL contains slashes.
  sed -i "s|${PLACEHOLDER}|${TARGET_URL}|g" "$file"
done

echo "Entrypoint script finished. Starting Nginx..."

# Execute the original command passed to the container (e.g., nginx -g 'daemon off;')
exec "$@"
