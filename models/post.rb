require 'octokit'

class Post

  def initialize(login:,  path:)
    @github = Octokit.contents("#{login}/blog", :path => "#{path}.md")
     
  end

end
