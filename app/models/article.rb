class Article < ApplicationRecord
    validates :title, :author, :content, presence: true
    
    has_many :comments, dependent: :destroy
end
