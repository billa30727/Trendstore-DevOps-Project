FROM node:18

WORKDIR /app

<<<<<<< HEAD
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
=======
RUN npm install -g serve

COPY dist ./dist

EXPOSE 3000

CMD ["serve", "-s", "dist", "-l", "3000"]
>>>>>>> 42951ae5099aba417c2b1df9db4080e6fc3e3233
