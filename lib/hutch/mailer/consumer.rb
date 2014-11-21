module Hutch
  module Mailer
    class Consumer
      include Hutch::Consumer
      include Deliverable

      consume Mailer.key
      queue_name Mailer.queue

      def process(msg)
        mailer = msg[:mailer].camelcase.constantize
        method_name = msg[:method_name].to_sym
        args = msg[:arguments]
        if msg[:object_type] && msg[:object_id]
          entity = msg[:object_type].constantize.find msg[:object_id]
          mail = mailer.public_send(method_name, entity, *args)
        else
          mail = mailer.public_send(method_name, *args)
        end
        deliver(mail)
      end

    end
  end
end
