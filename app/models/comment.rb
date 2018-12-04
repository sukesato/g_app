class Comment < ApplicationRecord
  belongs_to :blog #counter_cache: :blog_comments_count
end
