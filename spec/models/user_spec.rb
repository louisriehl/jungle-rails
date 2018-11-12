require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(
    name: 'Billy',
    password: 'password',
    password_confirmation: 'password',
    email: 'myemail@email.com'
    )}

  context 'Validations' do

    it 'should be valid when fields are valid' do
      expect(subject).to be_valid
    end

    it 'should be invalid when name is blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

  end

end
