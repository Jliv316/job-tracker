class Comment < ApplicationRecord
  belongs_to :job
  validates :body, presence: true
end