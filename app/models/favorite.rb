class Favorite < ApplicationRecord
  
  has_many :favorite_topics, through: :favorites, source: 'user'
  belongs_to :user
  belongs_to :topic
end
