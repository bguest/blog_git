source 'http://rubygems.org'
ruby '2.2.0'
gem 'sinatra',            '~>1.4'
gem 'puma',               '~>2.11' # Server
gem 'slim',               '~>3.0'  # Template Engine
gem 'faraday-http-cache', '~>1.0'  # Caching
gem 'octokit',            '~>3.7'  # GitHub
gem 'redcarpet',          '~>3.2'  # Markdown parser
gem 'rouge',              '~>1.8'  # Syntax Highlighting
gem 'dotenv',             '~>1.0'  # Environmental Variables

group :development, :test do gem 'pry-byebug', '~>3.0'
  gem 'pry-stack_explorer', '~> 0.4.9'
end

group :test do
  gem 'webmock', '~>1.20'  # Stub web requests
  gem 'rspec', '~>3.2'     # Testing Framework
end
