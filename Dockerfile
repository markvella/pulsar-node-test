FROM node:12.18 
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN apt update
RUN apt install python3
RUN apt install wget
RUN cd /var/ & mkdir /pulsar/ & wget https://downloads.apache.org/pulsar/pulsar-2.6.1/DEB/apache-pulsar-client.deb & wget https://downloads.apache.org/pulsar/pulsar-2.6.1/DEB/apache-pulsar-client-dev.deb
RUN apt install ./apache-pulsar-client.deb
RUN apt install ./apache-pulsar-client-dev.deb
RUN npm install --production && mv node_modules ../
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]