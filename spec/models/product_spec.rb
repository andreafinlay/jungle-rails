require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid if it has a name, price, quantity, and category" do
      cat4 = Category.create({name: 'Swords'})
      product = cat4.products.create(
        name: "Echo, Promise of the Dreadlord",
        price: 420.00,
        quantity: 70
      )
      expect(product).to be_valid
      puts product.errors.full_messages
    end

    it "is not valid without a category" do
      product = Product.create(
        name: "Silverlight, Reaver of Lost Worlds",
        price: 420.00,
        quantity: 70
      )
      expect(product.errors).to have_key(:category)
      puts product.errors.full_messages
    end

    it "is not valid without a name" do
      cat4 = Category.create({name: 'Swords'})
      product = cat4.products.create(
        name: nil,
        price: 420.00,
        quantity: 70
      )
      expect(product.errors).to have_key(:name)
      puts product.errors.full_messages
    end

    it "is not valid without a price" do
      cat4 = Category.create({name: 'Swords'})
      product = cat4.products.create(
        name: "Lifedrinker, Quickblade of the Prince",
        price: nil,
        quantity: 70
      )
      expect(product.errors).to have_key(:price)
      puts product.errors.full_messages
    end

    it "is not valid without a quantity" do
      cat4 = Category.create({name: 'Swords'})
      product = cat4.products.create(
        name: "Cometfell, Bane of Traitors",
        price: 420.00,
        quantity: nil
      )
      expect(product.errors).to have_key(:quantity)
      puts product.errors.full_messages
    end
  end
end
