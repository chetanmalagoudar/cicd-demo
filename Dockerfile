# FROM node:14

# # Setting working directory. All the path will be relative to WORKDIR
# WORKDIR /usr/src/app

# # Install app dependencies
# # A wildcard is used to ensure both package.json AND package-lock.json are copied
# # where available (npm@5+)
# COPY package*.json ./

# RUN npm install
# # If you are building your code for production
# # RUN npm ci --only=production

# # Bundle app source
# COPY . .

# EXPOSE 3000

# CMD [ "node", "index.js" ]


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