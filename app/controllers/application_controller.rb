class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Mongoid::Errors::DocumentNotFound, with: -> { render_404 }

  private

  def render_404
    redirect_to root_path, alert: 'Not Found!'
  end
end
