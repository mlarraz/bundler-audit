FROM ruby:3.0-alpine

# Install git
RUN apk add --no-cache git

# Where the gem lives
WORKDIR /src

COPY . /src

ENV BUNDLE_WITHOUT "development test"

RUN bundle install

# Bootstrap DB
RUN /src/bin/bundle-audit update

# Where the app gets mounted
WORKDIR /app

ENTRYPOINT ["/src/bin/bundle-audit"]
