class ResourcesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'resources'
  end
end  