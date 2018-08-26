require 'rails_helper'

describe 'Article Edit' do
  describe 'user clicks edit' do
    it 'edits article and redirects to article show page' do
      article = Article.create(title: "New Title", body: "New Body")

      visit article_path(article)

      click_link("Edit")

      expect(current_path).to eq(edit_article_path(article))
    end
  end
end
