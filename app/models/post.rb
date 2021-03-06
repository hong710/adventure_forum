class Post < ApplicationRecord
    belongs_to :user

    has_many :posts_categories
    has_many :categories, through: :posts_categories

    has_many :posts_comments
    has_many :comments, through: :posts_comments

    validates :post_title, presence: true
    validates :content, presence: true
end
