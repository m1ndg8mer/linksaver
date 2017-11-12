class StaticPagesController < ApplicationController
  def index
    @public_links = Link.public
  end
end
