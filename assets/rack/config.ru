#!/usr/bin/env ruby

use Annyong::Middleware
run Rack::Directory.new(".") # TODO Using "." might not be the best way…
