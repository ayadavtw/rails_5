require 'slack-notifier'
class Order < ApplicationRecord
  #TODO after/before [:create, :save :update] - send emails callbacks ?
  belongs_to :user

  after_create do
    notifier = Slack::Notifier.new ENV.fetch("webhook_url") do
      defaults channel: "#project",
               username: "notifier"
    end
    notifier.ping "New Order has been made for #{self.product}"
  end
end
