FROM node:6.12.2-slim

RUN mkdir -p /app/context
WORKDIR /app

ADD app/* /app/	

RUN npm install

WORKDIR /app/context

# Set default image container command to launch linting, xvfb, integration tests
ENTRYPOINT ["/app/run.sh"]
CMD ["test.js"]
