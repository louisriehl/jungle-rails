require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { described_class.new(name: 'Lamp',
                                price: 100,
                                quantity: 20,
                                category_id: 3,
                                category: Category.new
                                )
  }

  context 'Validations' do

    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should be invalid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    # Due to monetize, price is converted to price_cents
    it 'should be invalid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end

end
