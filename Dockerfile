FROM ruby

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

RUN gem install bundler
RUN gem install rails
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN apt-get update && apt-get install -y --no-install-recommends yarn

ENTRYPOINT ["/bin/bash"]
