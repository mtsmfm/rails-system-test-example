FROM mtsmfm/ruby-node
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update -qq \
  && apt-get install -y less postgresql-client-9.5
RUN yarn global add phantomjs-prebuilt

ARG APP_DIR=/app
ARG APP_USER=app
ARG APP_UID=1000
ARG LOCAL_BUILD=
RUN useradd --create-home --user-group --uid $APP_UID $APP_USER

ENV BUNDLE_PATH=$APP_DIR/vendor/bundle \
  BUNDLE_JOBS=4 \
  RAILS_LOG_TO_STDOUT=enabled \
  RAILS_SERVE_STATIC_FILES=enabled \
  LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  APP_DIR=$APP_DIR \
  APP_USER=$APP_USER \
  LOCAL_BUILD=$LOCAL_BUILD

WORKDIR $APP_DIR

COPY Gemfile* ./
RUN chown -R $APP_USER $APP_DIR
USER $APP_USER
RUN if [ -z "$LOCAL_BUILD" ]; then \
  bundle install \
;fi

COPY . .

CMD ["bin/rails", "server"]
