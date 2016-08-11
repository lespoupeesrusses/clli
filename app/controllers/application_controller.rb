class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :notify_activity

  protected

  def notify_activity
    current_user.try :touch
    ActionCable.server.broadcast 'users', User.online.collect(&:email)
  end
end
