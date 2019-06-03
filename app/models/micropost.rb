# Micropost name:string content:text cover:string
class Micropost < ApplicationRecord
	validates :name,  presence: true,
		uniqueness: true
	validates :content, presence: true

	belongs_to :user
end
