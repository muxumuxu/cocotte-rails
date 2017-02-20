FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /foodancy
WORKDIR /foodancy
ADD Gemfile /foodancy/Gemfile
ADD Gemfile.lock /foodancy/Gemfile.lock
ADD . /foodancy
RUN bundle install
CMD bundle exec rails s -p ${PORT:-3000} -b '0.0.0.0'
