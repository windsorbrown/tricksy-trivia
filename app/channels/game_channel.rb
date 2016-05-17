# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "player #{uid}"
    GameInstance.create(uid)
  end

  def unsubscribed
    GameInstance.remove(uid)
  end
end
