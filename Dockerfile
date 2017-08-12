FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /cocotte
WORKDIR /cocotte
ADD Gemfile /cocotte/Gemfile
ADD Gemfile.lock /cocotte/Gemfile.lock
ADD . /cocotte
RUN bundle install
CMD bundle exec rails s -p ${PORT:-3000} -b '0.0.0.0'
