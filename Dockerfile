FROM node:12-alpine

MAINTAINER "Chris Andrade <cdsandrade@gmail.com>"

WORKDIR /opt/local/1upwebapp
#COPY package.json package-lock.json ./
COPY . ./

RUN npm install \
&& npm run lint \
#&& npm run test \
&& npm run build

#COPY . ./

ENV ONEUP_DEMOWEBAPPLOCAL_CLIENTID= \
	ONEUP_DEMOWEBAPPLOCAL_CLIENTSECRET=

EXPOSE 3000

CMD ["npm", "run", "dev"]
