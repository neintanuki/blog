class Article < ApplicationRecord
  validates :title, :author, :body, presence: true
  validates :title, :author, length: { maximum: 100 }
end
