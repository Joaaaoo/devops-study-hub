# Dockerfile
FROM node:18 AS builder
WORKDIR /app
COPY ./angular-app /app
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
