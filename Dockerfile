FROM node:25-slim as BUILDER
WORKDIR /app
COPY ./app/package.json ./app/yarn.lock ./ 
RUN yarn install --frozen-lockfile
COPY /app /app/
RUN yarn build

FROM nginx:alpine AS runtime
RUN rm -rf /usr/share/nginx/*
COPY --from=BUILDER /app/build /usr/share/nginx/html
EXPOSE 80
