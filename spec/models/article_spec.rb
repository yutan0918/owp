require 'rails_helper'

RSpec.describe Article, type: :model do
  it "タイトルがある場合、有効である" do
    article = Article.new(title: "TEST")
    expect(article).to be_valid
  end
  it "タイトルがない場合、無効である" do
    article = Article.new(title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end
end
