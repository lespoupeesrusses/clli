class VisualController < ApplicationController
  def index
    @resources = Resource.all.order(created_at: :desc).limit(20)
  end
end
