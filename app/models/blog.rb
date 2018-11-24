class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { in: 1..140 } 
  validates :priority, presence: true
  has_many :comments, dependent: :destroy
  
end
