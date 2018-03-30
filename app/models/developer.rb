class Developer < ApplicationRecord
  has_many :developer_languages, dependent: :destroy
  has_many :languages, through: :developer_languages

  has_many :developer_programming_languages, dependent: :destroy
  has_many :programming_languages, through: :developer_programming_languages

  validates :email, presence: true, uniqueness: true
end

def self.search(search)
	# if search
		where("name LIKE ? OR ingredients LIKE ? OR cooking_instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
	# else 
	# 	find(:all)
	# end
end