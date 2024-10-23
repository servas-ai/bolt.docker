# Use an official Node.js runtime as the base image
FROM node:20.15.1

# Set the working directory in the container
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@9.4.0

# Copy package.json and pnpm-lock.yaml (if available)
COPY package.json pnpm-lock.yaml* ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Copy the .env file
COPY .env .env

# Build the application
RUN pnpm run build

# Expose the port the app runs on (adjust if you specified a different port)
EXPOSE 3000

# Start the application
CMD ["pnpm", "run", "start"]
