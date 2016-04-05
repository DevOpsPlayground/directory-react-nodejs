FROM mhart/alpine-node

# Mount src directory
VOLUME ["/code"]
WORKDIR /code

# Install the necessary modules
RUN npm -g install nodemon

EXPOSE  5000
CMD ["nodemon", "/code/server.js"]
