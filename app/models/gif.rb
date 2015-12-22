class Gif < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  validates :giphy_id, :url, presence: true
end
