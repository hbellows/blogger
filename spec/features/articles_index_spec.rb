require 'rails_helper'

describe 'Articles Index' do
  describe 'user sees all articles' do
    it 'should show all articles' do
      article_1 = Article.create(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create(title: 'Title 2', body: 'Body 2')

      visit articles_path

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)

      expect(page).to have_link(article_1.title)
      expect(page).to have_link("Create a New Article")
    end
  end
  describe 'user creates a new article' do
    describe 'user links from index to create new article form' do
      it 'creates a new article' do

        visit articles_path
        click_link("Create a New Article")

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]",  with: "New Body!"
        click_on "Create Article"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New TBody!")
      end
    end
  end
end
