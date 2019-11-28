# Build a container
```docker build -t laravel .```

# Start a running container and bind it to the current folder
```docker run --name container_name --mount type=bind,source="$(pwd)",target=/app -p 8000:8000 laravel```

# Install composer dependancies
```docker run --rm -v $(pwd):/app composer install```

# Stop container
```docker stop container_name```

# Interactive bash shell inside the  container
```docker exec -it container_name bash```

# Artisan commands
```docker exec -it megan php artisan cmd....```
