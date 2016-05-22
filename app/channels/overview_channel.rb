# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class OverviewChannel < ApplicationCable::Channel
  def subscribed
    stream_from "overview_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
