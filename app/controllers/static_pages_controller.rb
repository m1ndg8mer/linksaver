class StaticPagesController < ApplicationController
  def index
    @links = Link.public
  end
end
