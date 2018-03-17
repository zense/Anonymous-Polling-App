FROM ruby:2.4-alpine

RUN apk --update add --virtual\
  build-dependencies build-base libev libev-dev postgresql-dev nodejs bash\
  tzdata sqlite-dev git curl

RUN npm install -g yarn

WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/

ENV RAILS_ENV=development
ENV NODE_ENV=development

RUN bundle install --jobs 8

COPY package.json /app/

RUN yarn install

COPY . /app

RUN rake db:create && rake db:migrate

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s"]
