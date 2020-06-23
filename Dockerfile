FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y nodejs yarn

RUN mkdir /takemon
WORKDIR /takemon

ADD Gemfile /takemon/Gemfile
ADD Gemfile.lock /takemon/Gemfile.lock

RUN gem update bundler
RUN bundle -v
RUN bundle install

ADD . /takemon
