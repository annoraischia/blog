class Article < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: 'title', message: 'should be unique'}
    validates :author, presence: true
    validates :content, presence: true

    has_many :comments, dependent: :destroy
    has_and_belongs_to_many :tags
    has_many :sections
    has_many :advertisements, through: :sections
    has_and_belongs_to_many :categories

    accepts_nested_attributes_for :sections
    accepts_nested_attributes_for :tags
    accepts_nested_attributes_for :sections

    before_validation :set_content
    after_create :set_comment


    def set_content
        self.content = 'Default Content' if self.content.nil? || self.content.blank?
    end

    def set_comment
        Comment.create(article:self, content:'Great article!')
    end
end
