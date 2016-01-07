FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node.js and npm
RUN     yum install -y nodejs npm

# Mount the app source
#VOLUME ["/usr/local/src", "/directory-react-nodejs"]

# Set the working directory
RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

# Install the necessary modules
RUN npm install && npm -g install nodemon

EXPOSE  5000
CMD ["nodemon", "/directory-react-nodejs/server.js"]
