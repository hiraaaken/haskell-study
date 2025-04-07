# Use the official Haskell image as base
FROM haskell:9.4.7

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
  apt-get install -y \
  git \
  vim \
  curl \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Set default command
CMD ["ghci"] 