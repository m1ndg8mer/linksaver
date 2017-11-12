class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = current_user.tags
  end

  def show
    @links = Link.tagged_with(params['id']).where(user: current_user)

    render 'links/index'
  end
end
