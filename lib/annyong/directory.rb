module Annyong
  class Directory < Rack::Directory
    DIR_FILE = "<tr><td class='name'><a href='%s'>%s</a></td><td class='size'>%s</td><td class='type'>%s</td><td class='mtime'>%s</td></tr>"
    DIR_PAGE = <<-PAGE
<!doctype html>
<html><head>
  <title>%s</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width" />
  <style type="text/css">
  #{File.read(File.join(File.dirname(__FILE__), "../../assets/css/annyong.css")).gsub(/%/, "%%")}
  </style>
</head><body>
<h1>%s</h1>
<table>
  <tr>
    <th class='name'>Name</th>
    <th class='size'>Size</th>
    <th class='type'>Type</th>
    <th class='mtime'>Last Modified</th>
  </tr>
%s
</table>
<footer><code>#{FileUtils.pwd.chomp}</code>, <a target='_blank' title='Powered by annyong' href='https://github.com/remiprev/annyong'>annyong</a>!</footer>
</body></html>
    PAGE

    def each
      page = DIR_PAGE % [html_title, page_title, files]
      page.each_line { |content| yield content }
    end

  private

    def html_title
      path = @path.sub(/^#{@root}/,'').gsub(/\/$/, '')
      File.basename(FileUtils.pwd) + path
    end

    def page_title
      parts = html_title.split('/')
      parts.each_with_index.map do |item, index|
        "<a href='#{'../' * (parts.length - index - 1)}'>#{item}</a>"
      end.join(' / ')
    end

    def files
      @files.map { |file| DIR_FILE % file } * "\n"
    end
  end
end
