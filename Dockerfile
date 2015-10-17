FROM nodesource/trusty:0.12.7

# install pm2 process manager
RUN npm install pm2 -g
# dump will start pm2 daemon and create everything needed
RUN pm2 dump

# don't put the files in docker container, user -v
VOLUME ["/usr/src/app/db"]

EXPOSE 8080

# cache package.json and node_modules to speed up builds
# Add your source files
ADD . .
CMD ["npm", "install"]

CMD ["pm2", "start", "server.js", "--no-daemon"]
