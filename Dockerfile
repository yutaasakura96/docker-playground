FROM node:16.20.2-alpine
RUN addgroup app && adduser -S -G app app
USER app
WORKDIR /app
RUN mkdir data
COPY --chown=app:app package*.json .
RUN npm install
COPY --chown=app:app . .
ENV API_URL=http://api.myapp.com/
EXPOSE 3000
CMD ["npm", "start"]
