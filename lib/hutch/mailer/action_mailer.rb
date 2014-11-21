module Hutch
  module Mailer
    ##
    # Adds 'delay' method to ActionMailer to offload arbitrary email delivery to Hutch.  Example:
    #
    #    UserMailer.delay.send_welcome_email(new_user)

    module ActionMailer
      def hutch_delay(options={})
        Proxy.new(Mailer.key, self.name, options)
      end
      alias_method :delay, :hutch_delay unless Mailer.inline?

      def inline_delay(options={})
        Inline.new(self, options)
      end
      alias_method :delay, :inline_delay if Mailer.inline?

    end

  end
end
