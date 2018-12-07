class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { in: 1..140 } 
  validates :priority, presence: true
  has_many :comments, dependent: :destroy
  has_many :labels, dependent: :destroy
  has_many :labels_priorities, through: :labels, source: :priority
  belongs_to :user
  enum status: { A: 0, B: 1, C: 2 }
  
  def getStatusKeyFromValue
    Blog.statuses.invert[self.priority]
  end
end
