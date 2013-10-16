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
      show_path = @path.sub(/^#{@root}/,'')
      files = @files.map{|f| DIR_FILE % f }*"\n"
      page  = DIR_PAGE % [ show_path, show_path , files ]
      page.each_line{|l| yield l }
    end

  end
end
