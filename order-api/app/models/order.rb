require 'slack-notifier'
class Order < ApplicationRecord
  #TODO after/before [:create, :save :update] - send emails callbacks ?
  belongs_to :user

  after_create do
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
      defaults channel: "#project",
               username: "notifier"
    end
    notifier.ping "New Order has been made for #{self.product}"
  end
end
