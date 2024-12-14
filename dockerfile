# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the server.js file into the container
COPY server.js .

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["node", "server.js"]
