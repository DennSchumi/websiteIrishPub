# Verwende ein Nginx-Basis-Image
FROM nginx:alpine

# Entferne die Standard-Nginx-Inhalte
RUN rm -rf /usr/share/nginx/html/*

# Kopiere die gebauten React-Dateien in das Nginx-Verzeichnis
COPY build/ /usr/share/nginx/html/

# Exponiere den Standard-Port
EXPOSE 80

# Starte Nginx
CMD ["nginx", "-g", "daemon off;"]
