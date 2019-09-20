# frozen_string_literal: true

module Puma
  class IOBuffer < String
    def initialize
      if RUBY_VERSION < "2.2"
        super
      else
        super(capacity: 4096)
      end
    end

    def append(*args)
      args.each { |a| concat(a) }
    end

    alias reset clear
  end
end
