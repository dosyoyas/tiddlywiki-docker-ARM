FROM arm32v7/node

RUN npm install -g tiddlywiki@5.1.21

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD tiddlyweb_host /tiddlyweb_host_template
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
EXPOSE 8080
CMD ["/usr/local/bin/init-and-run-wiki"]
