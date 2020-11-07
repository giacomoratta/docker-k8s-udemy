# Use an existing docker image as a base
#FROM alpine
FROM node:12.18

# Set-up files and directory
# without workdir, we would mix system directories with project directories
WORKDIR /usr/app

# Download and install a dependency (cache-friendly)
COPY ./package.json ./
RUN npm install

COPY ./ ./

# Startup command for the container
CMD ["npm", "start"]

# Build command
# docker build -t giacomoratta/simpleweb:latest .

# Port mapping (one-time setting) [ports local:container]
# docker run -p 8080:8080 giacomoratta/simpleweb