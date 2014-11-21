module Hutch
  module Mailer
    autoload :ActionMailer, 'hutch/mailer/action_mailer'
    autoload :Consumer, 'hutch/mailer/consumer'
    autoload :Deliverable, 'hutch/mailer/deliverable'
    autoload :Inline, 'hutch/mailer/inline'
    autoload :Proxy, 'hutch/mailer/proxy'

    def self.config
      yield
      self
    end

    def self.inline=(inline)
      @inline = inline
    end

    def self.inline?
      @inline
    end

    def self.key=(key)
      @key = key
    end

    def self.key
      @key ||= ENV['HUTCH_MAILER_KEY'] || 'hutch.send.email'
    end

    def self.queue=(queue)
      @queue = queue
    end

    def self.queue
      @queue ||= ENV['HUTCH_MAILER_QUEUE'] || 'hutch_mailer'
    end

  end
end
