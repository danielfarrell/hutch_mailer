module Hutch
  module Mailer
    class Proxy < BasicObject
      def initialize(key, mailer, opts={})
        @key = key
        @mailer = mailer
        @opts = opts
      end

      def method_missing(name, *args)
        ::Hutch.connect
        ::Hutch.publish(@key, {mailer: @mailer, method_name: name, arguments: args})
      end
    end

  end
end
