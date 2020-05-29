FROM ruby:2.5.3
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs
RUN mkdir /app
ENV ROOT /app
WORKDIR $ROOT

ADD ./Gemfile $ROOT/Gemfile
ADD ./Gemfile.lock $ROOT/Gemfile.lock

RUN bundle install

ADD . $ROOT
