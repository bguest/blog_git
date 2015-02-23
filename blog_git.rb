require 'sinatra'
require 'octokit'
require 'slim'
require 'pry' if ENV['RACK_ENV'] == 'development'
require 'base64'
require './config/initializers'
require './models'
require './helpers'

set :server, %w[thin mongrel webrick]

get "/" do
  @title = 'About BlogGit'
  @post = Post.new(login: 'bguest', repository:'blog_git', path:'README')
  slim :post
end

get "/:login" do
  @blog = Blog.new(login: params[:login])
  @readme = Post.new(login: params[:login], path:'README')
  slim :blog
end

get "/:login/:path" do
  @blog = Blog.new(login: params[:login])
  @post = Post.new(login: params[:login], path: params[:path])
  slim :post
end

#get "/:login" do
  #files = Octokit.contents("#{params[:login]}/blog")
  #file = Octokit.contents('bguest/blog', :path => 'my_first_blog.md')
  #test = Base64.decode(file.content)

#end

