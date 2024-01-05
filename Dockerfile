FROM node:20-alphine as stage

WORKDIR /src/app
COPY . .
RUN npm install
RUN npm run build

FROM node:20-alphine

WORKDIR /src/app
COPY --from=stage /src/app/dist ./dist
CMD {"node", "dist/main.js"}