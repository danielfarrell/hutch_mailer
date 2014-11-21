module Hutch
  module Mailer
    module Deliverable

      protected

      def deliver(mail)
        return unless (mail && (mail.to || mail.cc || mail.bcc) && mail.from)
        if mail.respond_to?(:deliver_now)
          # Rails 4.2/5.0
          mail.deliver_now
        else
          # Rails 3.2/4.0/4.1
          mail.deliver
        end
      end

    end
  end
end
