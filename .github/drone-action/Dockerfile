FROM node:12

LABEL "com.github.actions.name"="drone-deploy-action"
LABEL "com.github.actions.description"="Trigger Drone.io Deployment"
LABEL "com.github.actions.icon"="triangle"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/rohit-smpx/rohit-smpx.github.io"
LABEL "homepage"="http://github.com/rohit-smpx/rohit-smpx.github.io"
LABEL "maintainer"="Rohit Gohri <gohri.rohit@gmail.com>"

COPY package*.json ./
RUN npm install

COPY . .

# Run `node /index.js`
ENTRYPOINT ["node", "/script.js"]