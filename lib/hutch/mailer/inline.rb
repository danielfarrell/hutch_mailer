module Hutch
  module Mailer
    class Inline < BasicObject
      include Deliverable

      def initialize(mailer, opts={})
        @mailer = mailer
      end

      def method_missing(name, *args)
        mail = @mailer.send(name, *args)
        deliver(mail)
      end

    end

  end
end
