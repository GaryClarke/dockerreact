# build phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

# this is done so that a full build is not required when changes are made to application code
# all previous stages can be retrieved from cache
COPY . .

RUN npm run build

# run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html






