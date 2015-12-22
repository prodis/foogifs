class GifSerializer < ActiveModel::Serializer
  attributes :id, :giphy_id, :url, :tag_list
end
