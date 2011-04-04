module Annyong
  VERSION = '0.1'
  autoload :Middleware, "annyong/middleware"
end

unless "".respond_to?(:each)
  String.class_eval do
    def each &block
      self.lines &block
    end
  end
end
