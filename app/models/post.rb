class Post < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
	def display_image
		image.variant(resize_to_limit: [500, 500])
	end
end
