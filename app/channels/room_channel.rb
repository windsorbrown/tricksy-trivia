# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:game_id]}"
  end

  # def unsubscribed
  #   stop_all_streams
  # end
end

