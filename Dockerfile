FROM arm32v6/node:lts-alpine3.15

RUN npm install -ddd -g tiddlywiki@5.2.1

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD tiddlyweb_host /tiddlyweb_host_template
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
USER node
EXPOSE 8080
CMD ["/usr/local/bin/init-and-run-wiki"]
