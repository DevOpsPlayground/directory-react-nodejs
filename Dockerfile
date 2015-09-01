FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y nodejs npm

# Bundle app source
COPY . /directory-react-nodejs
# Install app dependencies
RUN cd /directory-react-nodejs; npm install

EXPOSE  5000
CMD ["node", "/directory-react-nodejs/server.js"]
