FROM nodesource/trusty:0.12.7

# cache package.json and node_modules to speed up builds
# Add your source files
ADD . .
CMD ["npm","install"]

EXPOSE 8080
CMD ["npm","start"]
