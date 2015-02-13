require 'sinatra'
require 'octokit'
require 'pry'
require 'base64'
require './initializers'

set :server, %w[thin mongrel webrick]

get "/" do
  @title = 'About BlogGit'
  slim :welcome
end

get "/:login" do
  files = Octokit.contents("#{params[:login]}/blog")
  file = Octokit.contents('bguest/blog', :path => 'my_first_blog.md')
  test = Base64.decode(file.content)

end
