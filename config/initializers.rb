require 'dotenv'
Dotenv.load(
  File.expand_path("../../.#{ENV['RACK_ENV']}.env", __FILE__),
  File.expand_path("../../.env",  __FILE__)
)

require './presenters/post'

require 'faraday-http-cache'

stack = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end
Octokit.middleware = stack
