FROM node:20.18.0-alpine AS builder
LABEL authors="kaktus"
WORKDIR /app
COPY package*.json nx.json tsconfig.base.json eslint.config.js ./
COPY apps ./apps
RUN echo ls -la
RUN npm ci
RUN npm install -g nx
ENV NX_DAEMON=false
RUN nx reset
RUN nx run codegenerato:build:production --verbose

FROM nginx:1.19.0-alpine
WORKDIR /usr/share/nginx/html
COPY apps/codegenerato/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist/apps/codegenerato/browser /usr/share/nginx/html
EXPOSE 80 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]

