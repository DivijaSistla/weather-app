# Dockerfile
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the new port your app runs on
EXPOSE 3000

# Start the application (ensure your app listens on this port)
CMD ["npm", "start"]
