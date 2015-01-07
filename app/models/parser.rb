require 'redcarpet'

class Parser

  def markdown_to_HTML(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    return markdown.render(text)
  end

end