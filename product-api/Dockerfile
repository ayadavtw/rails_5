FROM ruby:2.7.0
#Install PGsql dependencies and js engine
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /api
WORKDIR /api
COPY ./Gemfile /api/Gemfile
COPY ./Gemfile.lock /api/Gemfile.lock
RUN gem install bundler:2.1.4 && bundle install
COPY . /api
#Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]