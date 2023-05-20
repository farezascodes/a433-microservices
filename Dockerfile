# ambil image node versi 14
FROM node:14

# set workdir container
WORKDIR /app

# copy semua content dr host ke workdir container
COPY . .

# set environment variable di container
ENV NODE_ENV=production \
 DB_HOST=item-db

# build image
RUN npm install --production --unsafe-perm && npm run build

# expose container port
EXPOSE 8080

# jalankan npm start tiap container dijalankan pertama kali
CMD ["npm","start"]