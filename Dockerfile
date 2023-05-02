# build stage
FROM node:hydrogen-alpine AS builder

RUN npm i -g npm@latest && npm i -g pnpm@latest

# Create app directory
WORKDIR /app

COPY . .

RUN pnpm i && pnpm build

# run stage
FROM nginx:stable-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist /usr/share/nginx/html
