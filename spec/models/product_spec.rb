require 'rails_helper'

describe Product do
  context "when the product has comments" do

    before do
      @product = Product.create!(name: "race bike", price: 50, image_url: "www.ergwer.to", color: "white")
      @user = User.create!(email: "john@john.com", password: "johnjohn")
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Fantastic bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Ok")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    it "is not valid" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end

end