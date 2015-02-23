require 'base64'

class Post

  META_DATA = %w(title author subtitle) # Date requires extra
  attr_reader :login, :path

  def initialize(login:,  path:, repository: 'blog')
    @login = login
    @path = path.gsub(/\.(md|markdown)$/,'')
    @repository = repository
  end

  def content
    @content ||= begin
                   github = Github.contents("#{login}/#{repository}", :path => "#{path}.md")
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

    lines = content.split("\n")
    meta_end = 0
    lines.each_with_index do | line, idx |
      if !any_meta_match?(line)
        meta_end = idx
        break
      end
    end
    @body = lines[meta_end .. -1].join("\n")
  end

  def comments?
    return @comments unless @comments.nil?
    match = meta_match(content, 'comments')
    match = match && match.downcase
    if match
      return true if match == 'true'
      return false if match == 'false'
    end
    nil
  end

  def date
    @date ||= begin
                match = meta_match(content, 'date')
                match && Date.parse(match)
              rescue ArgumentError => the_error
                if the_error.message == 'invalid date'
                  nil
                else
                  raise the_error
                end
              end
  end

  private

  attr_reader :repository

  def any_meta_match?(str)
    (META_DATA + ['date', 'comments']).collect do |meta|
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
