require 'octokit'

module Github
  extend self

  def client
    @client ||= Octokit::Client.new \
      :client_id     => ENV['GITHUB_CLIENT_ID'],
      :client_secret => ENV['GITHUB_CLIENT_SECRET']
  end

  def method_missing(method, *args, &block)
    if client.respond_to? method
      client.send(method, *args, &block)
    else
      super
    end
  end
end
