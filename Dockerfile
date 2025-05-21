FROM docker:dind

# Install docker-compose
RUN apk add --no-cache docker-compose git

# Clone the repository
WORKDIR /app
COPY . /app

# Script to start all services
RUN echo '#!/bin/sh\n\
dockerd &\n\
sleep 5\n\
cd /app && docker-compose --profile cpu up\n\
' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
