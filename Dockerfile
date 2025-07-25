FROM node:22.17.0-alpine3.22 AS builder
WORKDIR /app
ADD ./server/ ./
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN npm install -g pnpm@latest-10
RUN pnpm install --no-frozen-lockfile

FROM node:22.17.0-alpine3.22
WORKDIR /app
COPY --chown=node:node --from=builder /app ./
CMD ["npm", "start"]
EXPOSE 8080
