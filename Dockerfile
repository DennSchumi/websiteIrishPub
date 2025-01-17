# Phase 1: Build the Next.js app
FROM node:18-alpine AS build
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Build the application for production
COPY . ./
RUN npm run build

# Phase 2: Production environment
FROM node:18-alpine AS production
WORKDIR /app

# Install only production dependencies
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile --production

# Copy the build artifacts and application files
COPY --from=build /app ./

# Expose port for the Next.js production server
EXPOSE 3000
CMD ["npm", "run", "start"]
