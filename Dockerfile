FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs      

RUN mkdir /tumlog  
WORKDIR /tumlog

ADD ./Gemfile /tumlog/Gemfile
ADD ./Gemfile.lock /tumlog/Gemfile.lock

RUN gem install bundler:2.1.4
RUN bundle install
ADD . /tumlog
