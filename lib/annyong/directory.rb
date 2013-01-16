module Annyong
  class Directory < Rack::Directory
    DIR_FILE = "<tr><td><a href='%s'>%s</a></td><td>%s</td><td>%s</td><td>%s</td></tr>"
    DIR_PAGE = <<-PAGE
<!DOCTYPE html>
<html lang="en">
<head>
  <title>%s</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <style type="text/css">
    #{File.read(File.join(File.dirname(__FILE__), "../../assets/css/bootstrap.min.css")).gsub(/%/, "%%")}
    body {
      padding-top: 40px;
      padding-bottom: 10px;
    }
  </style>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="/">Annyong</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
<div class="container">
<h1>%s</h1>
<table class="table table-bordered table-hover">
  <tr>
    <th>Name</th>
    <th>Size</th>
    <th>Type</th>
    <th>Last Modified</th>
  </tr>
%s
</table>
<footer><code>#{FileUtils.pwd.chomp}</code>, <a target='_blank' title='Powered by annyong' href='https://github.com/remiprev/annyong'>annyong</a>!</footer>
</div>
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
