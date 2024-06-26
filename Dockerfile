# Start with the cypress/factory base image
FROM cypress/factory:latest

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install cypress@latest playwright-webkit@1.34 --save-dev

# Copy the rest of the project files
COPY . .

# Run the tests
CMD ["npx", "cypress", "run"]
