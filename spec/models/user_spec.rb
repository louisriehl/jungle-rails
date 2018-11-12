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

    context 'Passwords' do

      it 'should be valid when password and password_confirmation match' do
        subject.password = '12345'
        subject.password_confirmation = '12345'
        expect(subject).to be_valid
      end

      it 'should be invalid when there is no password' do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      it 'should be invalid when there is no password_confirmation' do
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end

      it 'should be invalid when password and password_confirmation do not match' do
        subject.password = '12345'
        subject.password_confirmation = '56789'
        expect(subject).to_not be_valid
      end

    end

    context 'Email' do

      it 'should be invalid when there is no email'

    end

  end

end
