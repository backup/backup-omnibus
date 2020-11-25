FROM ruby:2.6.6

RUN apt-get update \
    && apt-get install -fy --no-install-recommends fakeroot \
    && gem install bundler --no-document

WORKDIR /omnibus-backup

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY omnibus.rb .
COPY config ./config

ENV BACKUP_VERSION 5.0.0.beta.3

CMD bundle exec omnibus build backup
