source 'http://rubygems.org'
ruby '2.2.2'

# Synchronises Assets between Rails and S3.
gem 'fog-aws'
gem 'asset_sync'

gem 'rails', '4.2.3'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'codemirror-rails'
gem 'selectize-rails'
gem 'countries'
gem 'geocoder'
gem 'browserify-rails'
gem 'font-awesome-sass'

# they still haven't merged the PR to support sprockets 3, but will in the next few weeks
gem "compass-rails", git: 'https://github.com/robkilby/compass-rails', branch: 'sprockets-3'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'slim-rails'
gem 'liquid'
gem 'remotipart', '~> 1.2'


# Use Devise for Authentication
gem 'devise'
gem 'omniauth-google-oauth2'

# Rails admin for data administration
gem 'rails_admin'

# Use Paper Trail for containing a full history of our edits.
gem 'paper_trail'

gem 'rmagick' # rmagick for image processing
gem 'paperclip'
gem 'action_parameter'

# We need to use render inside a model in order to compile HTML for display
# in champaign-flute.
gem 'render_anywhere', require: false

# AWS SDK for Ruby
gem 'aws-sdk', '~> 2'
gem 'aws-sdk-v1'

# logger for debugging AWS
gem 'logger'

# # Caching for production
# gem 'rack-cache'
# gem 'redis-rack-cache'

# Gem for user agent / browser detection
gem 'browser'

gem 'share_progress', git: 'https://github.com/SumOfUs/share_progress', branch: 'master', require: false

gem 'newrelic_rpm'
gem 'puma'
gem 'typhoeus'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails'
  gem 'capybara' # Capybara for integration testing
  gem 'envyable'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
end


group :test do
  gem 'webmock'
  gem 'timecop'
end

# Rails Assets - reference any Bower components that you need as gems.
# https://rails-assets.org/
#
source 'https://rails-assets.org' do

  # Give your JS App some Backbone with Models, Views, Collections, and Events http://backbonejs.org
  gem 'rails-assets-backbone'

  # JavaScript's utility _ belt http://underscorejs.org
  gem 'rails-assets-underscore'

  # Reduce user-misspelled email addresses in your forms.
  gem 'rails-assets-mailcheck'

  # Dropzone is an easy to use drag'n'drop library. It supports image previews and shows nice progress bars.
  gem 'rails-assets-dropzone'

  # Generate a slug – transliteration with a lot of options
  gem 'rails-assets-speakingurl'
end

