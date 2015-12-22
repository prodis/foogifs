class SearchController < ApplicationController
  def index
    gifs = GiphyApi::Client.search(params[:q], limit: params[:limit].to_i)

    if current_user
      giphy_ids = gifs.map { |g| g[:giphy_id] }
      saved_giphy_ids = current_user.gifs.where(giphy_id: giphy_ids).select(:giphy_id).map(&:giphy_id)

      gifs.each do |gif|
        gif[:saved] = saved_giphy_ids.include?(gif[:giphy_id])
      end
    end

    render json: gifs
  end
end
