# Schedule group:string teacher:reference classroom:string day:integer[0..7]
class Schedule < ApplicationRecord
	validates :group, presence: true
	validates :teacher_id, presence: true
	validates :classroom, presence: true
	validates :day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
	validates :lesson, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7 }

	belongs_to :teacher
end
