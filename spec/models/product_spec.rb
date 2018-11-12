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

  end

end
