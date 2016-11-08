FROM mhart/alpine-node:6.9.1

# Create an unprivileged user
# There is a reference to this user in `harden.sh` which is executed towards
# the end of this file
RUN adduser -D -s /bin/sh -u 1000 appuser

# Globally install `yarn`
RUN npm install -g yarn

# Copy package.json + yarn.lock and install packages.
# Copying package.json/yarn.lock in a separate step ensures this is cached on
# rebuilding the image
RUN mkdir /code
COPY package.json yarn.lock /code/
WORKDIR /code
RUN yarn install

# Copy the application code and set the unprivileged usr as owner
COPY src /code/src/
RUN chown -R appuser:appuser /code/*

# Copy and run `harden.sh` which adds security measures to alpine. See
# `/docker/README.md` for more info
COPY docker/harden.sh /harden.sh
RUN chmod +x /harden.sh && /harden.sh && rm /harden.sh

# Set active user as the unprivileged user
USER appuser
EXPOSE 3000

# Run command
CMD ["node", "src/server.js"]
