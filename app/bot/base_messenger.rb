class BaseMessenger
  def initialize
    @payload = []
  end

  def deliver_now
    @payload.each do |message|
      Bot.deliver(message, access_token: ENV['ACCESS_TOKEN'])
    end
  end


  def self.method_missing(method_name, *args)
    if instance_methods.include?(method_name)
      new.send(method_name, *args)
    else
      super
    end
  end

  private

  def message(attr)
    @payload << {
      recipient: { id: attr[:to] },
      message: attr[:message]
    }
    self
  end

  def messages(attr)
    attr[:messages].each do |message|
      message(to: attr[:to], message: message)
    end
    self
  end
end
