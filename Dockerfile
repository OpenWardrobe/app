FROM dart:stable AS build

# Set working directory inside the container
WORKDIR /app

# Install Flutter manually
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
ENV PATH="/flutter/bin:$PATH"

# Verify Flutter installation
RUN flutter --version

# Copy project files
COPY . .

# Get dependencies
RUN flutter pub get

RUN dart pub run build_runner build --delete-conflicting-outputs

# Build Flutter Web
RUN flutter build web --release

# Use Nginx as a lightweight web server
FROM nginx:alpine

# Copy built Flutter Web files to Nginx's HTML directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
