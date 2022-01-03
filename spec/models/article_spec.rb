require 'rails_helper'

RSpec.describe Article, type: :model do
    let!(:article) {Article.new}

    context 'Validations' do
        it 'is not a valid name' do
            article.content = 'Test Body'
            article.title = nil

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:title,:author)
        
        end

        it 'should be unique' do
            Article.create(:title => 'Duplicate Title', :content => 'Body', :author => 'Me')
            article.title = 'Duplicate Title'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:title)
            expect(article.errors[:title]).to include('should be unique')

        end

    end
end