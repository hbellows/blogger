require "rails_helper"

describe "user sees one article" do
  describe "they link from the article index" do
    it "displays information for one article" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
  describe 'user clicks delete link on article show page' do
    it 'displays all articles on index page without the deleted article' do
      article_1 = Article.create!(title: "New Title 1", body: "New Body 1")
      article_2 = Article.create!(title: "New Title 2", body: "New Body 2")

      visit article_path(article_1)
      click_link("Delete")

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)
      expect(page).to_not have_content(article_1.title)
      expect(page).to_not have_content(article_1.body)
    end
  end
end
