module Presenter
  class Post < SimpleDelegator

    def link(text = name)
      "<a href='#{path}'>#{text}</a>"
    end

    def object
      __getobj__
    end

    def name
      object.path.split('_').map(&:capitalize).join(' ')
    end

    def path
      "/#{login}/#{object.path}"
    end

  end

end
