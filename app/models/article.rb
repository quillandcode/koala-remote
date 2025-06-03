class Article < ApplicationRecord
    validates :title, length: { maximum: 40 }
    validates :content, :author, :category, :published_at, :title, presence: true
end
