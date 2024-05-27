FROM ruby:3.1

# Install dependencies
RUN apt-get update -y && apt-get install -y build-essential nodejs

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# RUN gem install jekyll-sitemap

# Set the working directory
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock to ensure they're cached
COPY Gemfile Gemfile.lock ./

# Install the gems specified in the Gemfile
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose port 4000
EXPOSE 4000

# Serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--force_polling"]
