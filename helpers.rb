require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

helpers do

  def active_ppost?(post)
    request.path_info == post.path
  end

  def h(text)
    Rack::Utils.escape_html(text)
  end

  class RougeRenderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    @redcarpet ||= Redcarpet::Markdown.new(
      RougeRenderer,
      no_intra_enphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true, 
      strikethrough: true,
      superscript: true,
      underline: true,
      footnotes: true
    )
    @redcarpet.render(text)
  end


end

