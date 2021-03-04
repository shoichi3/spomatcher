FROM ruby:2.6.5

RUN apt-get update && \
    apt-get install -y mariadb-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /spomatcher

WORKDIR /spomatcher

COPY Gemfile /spomatcher/Gemfile
COPY Gemfile.lock /spomatcher/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /spomatcher