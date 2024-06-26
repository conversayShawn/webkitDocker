# Start with the cypress/factory base image
FROM cypress/browsers:node-20.14.0-chrome-126.0.6478.114-1-ff-127.0.1-edge-126.0.2592.61-1

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install cypress@latest playwright-webkit@1.34 --save-dev

# Copy the rest of the project files
COPY . .

# Set the entry point to run Cypress tests
ENTRYPOINT ["npx", "cypress", "run"]
