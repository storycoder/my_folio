class Sample < ActiveRecord::Base
	validates :name, presence: true
	validates :link, presence: true
	validates :description, presence: true
	belongs_to :user
end
