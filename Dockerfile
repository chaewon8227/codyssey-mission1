FROM nginx:alpine
LABEL org.opencontainers.image.title="chaewon-web"
ENV APP_ENV=dev
COPY site/ /usr/share/nginx/html/