require 'rails_helper'

RSpec.describe 'Articles', type: :feature do

    describe 'View all articles' do
        before {visit articles_path}

        it 'shows all articles in the body' do
            within 'body' do
                expect(page).to have_content('Hello, World!')
                expect(page).to have_content('New Article')

            end
        end

    describe 'Create a new article' do
        before {visit new_article_path}

        it 'shows create form in the body' do
            within 'body' do
                expect(page).to have_content('Create an article')
            end
        end

        it 'successfully creates a new article' do
            visit('/articles/new') do
                fill_in 'article_title', with: 'title'
                fill_in 'article_author', with: 'author'
                fill_in 'article_content', with: 'body'
                click_button('Create Article')
                expect(page).to have_current_path(articles_path)

            end
        end
        end
    end
end
