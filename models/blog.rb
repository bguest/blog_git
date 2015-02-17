class Blog
  include Enumerable
  attr_reader :login

  def initialize(login:)
    @login = login
  end

  def post_refs
    @post_refs ||= Github.contents("#{login}/blog") 
  end

  def each
    post_refs.each do |p|
      yield p
    end
  end

  def posts
    collect{|pr| Post.new(login: login, path: pr.path)}
  end

  def post_names
    collect{|p| p.name.gsub(/\.(md|markdown)$/, '')}
  end

end
