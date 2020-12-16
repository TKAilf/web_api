FROM ruby:2.5

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get install -y yarn

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       postgresql-client

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
  && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qq \
  && apt-get install -y google-chrome-stable libnss3 libgconf-2-4

RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` \
  && curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip \
  && unzip /tmp/chromedriver_linux64.zip \
  && mv chromedriver /usr/local/bin/

RUN mkdir /myapp
WORKDIR /myapp

ADD ./Gemfile ./
ADD ./Gemfile.lock ./

RUN gem update --system \
  && gem install bundler -v 2.2.0 \
  && bundle install

#ホストからコンテナにコピー（ホスト側は相対パス）
ADD . .

# Add a script to be executed every time the container starts.
ADD ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets tmp/pids \
  && touch tmp/sockets/puma.sock \
  && touch tmp/pids/server.pid
