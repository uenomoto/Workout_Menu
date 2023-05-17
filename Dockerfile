# Node.jsとYarnのステージ
FROM node:12.4-stretch as node

# Rubyのステージ
FROM ruby:3.1.2

# Node.jsとYarn
ENV YARN_VERSION 1.16.0
RUN mkdir -p /opt
COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx


# Rubyの必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  postgresql-client

WORKDIR /workout-meun-docker

# Bundlerを使って必要なgemをコンテナ内でインストールgemは容量が大きくなるためADD
ADD Gemfile Gemfile.lock /workout-meun-docker/
RUN bundle install
CMD ["rails", "s", "-b", "0.0.0.0"]