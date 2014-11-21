module Devise
  module Async
    module Backend
      class Hutch < Base
        def self.enqueue(notification, model, object_id, *args)
          ::Hutch.connect
          ::Hutch.publish(::Hutch::Mailer.key, {mailer: Devise.mailer.to_s, method_name: notification, object_type: model, object_id: object_id, arguments: args})
        end
      end
    end
  end
end
