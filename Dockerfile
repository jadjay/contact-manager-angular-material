FROM node:14-slim AS builder
RUN apt-get update
WORKDIR /usr/app
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run build

# FROM nginx:1-alpine 5 low level vuln CVE
# FROM nginx:latest 99 vuln CVE
# FROM ubuntu/nginx:1.18-22.04_beta
FROM nginx:1-alpine
COPY --from=builder /usr/app/dist/angularmaterial/ /usr/share/nginx/html
