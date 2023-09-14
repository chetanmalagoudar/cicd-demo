# Stage 1 : Build the NOdejs application
FROM node:14 AS build

WORKDIR /app/src

COPY package*.json ./

RUN npm install

COPY . .

## Stage 2: Create the production image

FROM node:14 as production

WORKDIR /app/src

COPY --from=build /app/src ./


EXPOSE 3000

ENTRYPOINT [ "node" ]

CMD [ "index.js" ]