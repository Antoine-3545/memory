<<<<<<< HEAD
# Base Debian complète
FROM debian:bullseye
=======
FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y nginx file \
    && rm -rf /var/lib/apt/lists/*
>>>>>>> origin/develop

# Installer nginx et file
RUN apt-get update \
    && apt-get install -y nginx file \
    && rm -rf /var/lib/apt/lists/*

# Créer le dossier pour les sources
RUN mkdir -p /var/concentration/html

# Copier les sources HTML
COPY html/ /var/concentration/html/

# Copier la config nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80
EXPOSE 80

# Lancer nginx en avant-plan
CMD ["nginx", "-g", "daemon off;"]
