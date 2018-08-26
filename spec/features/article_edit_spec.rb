require 'rails_helper'

describe 'Article Edit' do
  describe 'user clicks edit' do
    it 'edits article and redirects to article show page' do
      article = Article.create(title: "New Title", body: "New Body")

      visit article_path(article)

      click_link("Edit")

      expect(current_path).to eq(edit_article_path(article))
      fill_in "article[title]", with: "Different Title"
      fill_in "article[body]", with: "Different Body"
      click_on "Update Article"

      expect(current_path).to eq(article_path(article))

      expect(page).to have_content("Different Title")
      expect(page).to_not have_content("Title 1")
      expect(page).to have_content("Different Body")
      expect(page).to_not have_content("Body 1")
      expect(page).to have_content("Article Different Title Updated!")
    end
  end
end
