FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential locales nodejs

RUN locale-gen en_US.UTF-8 
ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8

RUN mkdir /dedonrails
WORKDIR /dedonrails
COPY Gemfile /dedonrails/Gemfile
COPY Gemfile.lock /dedonrails/Gemfile.lock
RUN bundle install
COPY . /dedonrails

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
