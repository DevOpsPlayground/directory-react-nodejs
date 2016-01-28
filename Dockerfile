FROM 315032081542.dkr.ecr.us-east-1.amazonaws.com/sameetn-repo:latest

# Mount src directory
VOLUME ["/code"]
WORKDIR /code

EXPOSE  5000
CMD ["nodemon", "/code/server.js"]
