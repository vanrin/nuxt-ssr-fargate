FROM node:16.15 as frontend-build


WORKDIR /src

COPY . .

RUN npm install \
    --prefer-offline \
    --frozen-lockfile \
    --non-interactive


RUN npm run build

RUN rm -rf node_modules && \
    NODE_ENV=production npm install \
    --prefer-offline \
    --pure-lockfile \
    --non-interactive \
    --omit=dev

FROM node:16.15-alpine 

WORKDIR /app

COPY --from=frontend-build /src  .

ENV HOST 0.0.0.0

EXPOSE 3000

ENTRYPOINT ["npm", "start"]