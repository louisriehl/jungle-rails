require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { described_class.new(name: 'Lamp',
                                price: 100,
                                quantity: 20,
                                category_id: 3,
                                category: Category.new
                                )
  }

  describe 'Validations' do

    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should be invalid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should have a nil price' do
      subject.price = nil
      expect(subject.price).to be_nil
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
