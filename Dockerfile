
# BUILD Phase:

FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# RUN Phase:

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# The default command for the nginx container  is good for us