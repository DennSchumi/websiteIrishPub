# Erste Phase: React-App bauen
FROM node:18 AS build
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# Zweite Phase: Statische Dateien mit Nginx bereitstellen
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
