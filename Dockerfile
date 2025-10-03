ARG JEKYLL_BASEURL=''

FROM ruby:alpine AS builder
RUN apk add --no-cache build-base git
RUN gem install bundler
WORKDIR /jekyll

COPY Gemfile Gemfile.lock ./
RUN bundle config set path vendor/bundle && bundle install

COPY . .
ARG JEKYLL_BASEURL
RUN bundle exec jekyll build --baseurl "$JEKYLL_BASEURL" --destination _site

# Option A: keep your subfolder copy (as you had)
# FROM nginx:alpine
# ARG JEKYLL_BASEURL
# COPY --from=builder /jekyll/_site /usr/share/nginx/html/$JEKYLL_BASEURL
# COPY nginx.conf /etc/nginx/nginx.conf
# EXPOSE 80

# Option B: simpler root copy
FROM nginx:alpine
COPY --from=builder /jekyll/_site/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
