
### BUILD ###

# base image
FROM node:14.3.0 as build

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY package.json /app/package.json 
COPY package-lock.json /app/package-lock.json
RUN npm install
RUN npm install -g @angular/cli@9.1.0

# add app
COPY . /app

# generate build
RUN ng build --prod


### FINAL CONTAINTER ###

# base image
FROM nginx:1.19.0-alpine

# remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# copy defaul nginx config
COPY nginx/default.conf /etc/nginx/conf.d/

# copy artifact build from the 'build environment'
COPY --from=build /app/dist/hello-spa /usr/share/nginx/html

# expose port 80
EXPOSE 80