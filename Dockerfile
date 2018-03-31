FROM ruby:2.4.4-jessie

RUN mkdir /webapps
WORKDIR /webapps

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  build-essential \
  locales \
  nodejs

ADD . /webapps/

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]