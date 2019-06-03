# Teacher name:string subject:string description:text photo:string
class Teacher < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :photo, presence: true
	validates :subject, presence: true
end
