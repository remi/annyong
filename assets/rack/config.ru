#!/usr/bin/env ruby

use Annyong::Middleware
run Rack::Directory.new(`pwd`.chomp)
