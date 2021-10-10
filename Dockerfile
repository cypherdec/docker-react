#this is a multi step process. run the steps as phases. then copy build folder from build phase to run phase 

#build phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#nginx will run itself, no run or cmd needed 
