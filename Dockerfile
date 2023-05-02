# assets build stage
FROM node:hydrogen-alpine AS assets-builder

RUN npm i -g npm@latest && npm i -g pnpm@latest

# Create app directory
WORKDIR /app

COPY . .

RUN pnpm i && pnpm build


FROM alpine:latest as builder

ARG DOWNLOAD_FILENAME=redbean-original-2.2.com

RUN apk add --update zip bash
RUN wget https://redbean.dev/${DOWNLOAD_FILENAME} -O redbean.com
RUN chmod +x redbean.com

# normalize the binary to ELF
RUN sh /redbean.com --assimilate

# Add your files here
COPY --from=assets-builder /app/dist /assets
WORKDIR /assets
RUN zip -r /redbean.com *

# just for debugging purposes
RUN ls -la /redbean.com
RUN zip -sf /redbean.com


FROM scratch

COPY --from=builder /redbean.com /

CMD ["/redbean.com", "-vv", "-c", "0", "-p", "80"]
