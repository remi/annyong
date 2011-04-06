module Annyong
  VERSION = '0.2'
  autoload :Directory, "annyong/directory"
end

unless "".respond_to?(:each)
  String.class_eval do
    def each &block
      self.lines &block
    end
  end
end
