class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_link, only: %i(edit update destroy share hide)

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    current_user.links.create!(link_params)

    redirect_to links_path, notice: 'Link was successfully created!'
  end

  def edit; end

  def update
    @link.update!(link_params)

    redirect_to links_path, notice: 'Link was successfully updated.'
  end

  def destroy
    @link.destroy

    redirect_to links_path, alert: 'Link was successfully deleted.'
  end

  def share
    @link.share!

    redirect_to links_path, notice: 'You successfully share link!'
  end

  def hide
    @link.hide!

    redirect_to links_path, alert: 'You successfully hide link.'
  end

  private

  def link_params
    params.require(:link).permit(
        :href,
        :description
    )
  end

  def initialize_link
    @link = Link.find(params[:id])
  end

end
