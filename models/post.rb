require 'base64'

class Post

  META_DATA = %w(title author subtitle) # Date requires extra
  attr_reader :login, :path

  def initialize(login:,  path:)
    @login = login
    @path = path.gsub(/\.(md|markdown)$/,'')
  end

  def content
    @content ||= begin
                   github = Github.contents("#{login}/blog", :path => "#{path}.md")
                   Base64.decode64(github.content)
                 end
  end

  META_DATA.each do |meta|
    class_eval <<-METHOD
      def #{meta}
        @#{meta} ||= meta_data(content, '#{meta}')
      end
    METHOD
  end

  def body
    return @body if @body
    @body = content.split("\n").select do | line |
      !any_meta_match?(line)
    end.join("\n")
  end

  def date
    @date ||= begin 
                match = meta_match(content, 'date')
                match && Date.parse(match)
              end
  end

  private

  def any_meta_match?(str)
    (META_DATA + ['date']).collect do |meta| 
      !!meta_match(str, meta)
    end.inject(false){|prev, this| prev || this}
  end

  def meta_match(str, meta)
    str[/#{meta}:\s*(.+?)\s*$/i, 1]
  end

  def meta_data(str, meta)
    meta_match(str, meta) || ""
  end
  
end
