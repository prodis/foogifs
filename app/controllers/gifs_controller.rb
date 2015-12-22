class GifsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.gifs
  end

  def create
    gif = current_user.gifs.create(gif_params)
    render json: gif, status: :created
  end

  private

  def gif_params
    params.require(:gif).permit(:giphy_id, :url, :tag_list)
  end
end
