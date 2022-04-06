# The first stage
# Build React static files
FROM node:13.12.0-alpine as build

WORKDIR /app/frontend
COPY ./frontend/package.json ./
COPY ./frontend/package-lock.json ./
RUN npm ci --silent
COPY ./frontend/ ./
RUN npm install -g npm-check-updates && \
    ncu -u --target minor && \
    npm install && \
    npm audit fix --force && \
    NODE_OPTIONS="--max-old-space-size=1024" npm run build

# The second stage
# Copy React static files and start nginx
FROM nginx:stable-alpine
COPY --from=build /app/frontend/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]