class Label < ApplicationRecord
  belongs_to :blog
  belongs_to :priority
end
