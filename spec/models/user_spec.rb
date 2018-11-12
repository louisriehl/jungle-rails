require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(
    name: 'Billy',
    password: 'password',
    password_confirmation: 'password',
    email: 'myemail@email.com'
    )}

  describe 'Validations' do

    it 'should be valid when fields are valid' do
      expect(subject).to be_valid
    end

    it 'should be invalid when name is blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    context 'Passwords' do

      it 'should be valid when password and password_confirmation match' do
        subject.password = '123456'
        subject.password_confirmation = '123456'
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
        subject.password = '123456'
        subject.password_confirmation = '567890'
        expect(subject).to_not be_valid
      end

      it 'should be invalid if password is shorter than 5 characters' do
        subject.password = '123'
        subject.password_confirmation = '123'
        expect(subject).to_not be_valid
      end

      it 'should be valid if the password is 5 characters' do
        subject.password = '12345'
        subject.password_confirmation = '12345'
        expect(subject).to be_valid
      end

    end

    context 'Email' do

      it 'should be invalid when there is no email' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'should be invalid if another user has the same email' do
        @subject = User.create( name: 'Fred', password: '12345', password_confirmation: '12345', email: 'newemail@email.com')
        @subject2 = User.create( name: 'Terry', password: '67890', password_confirmation: '67890', email: 'newemail@email.com')
        expect(@subject2).to_not be_valid
      end

      it 'should invalidate same emails regardless of case' do
        @subject = User.create( name: 'Fred', password: '12345', password_confirmation: '12345', email: 'newemail@email.com')
        @subject2 = User.create( name: 'Terry', password: '67890', password_confirmation: '67890', email: 'NEWEMAIL@email.com')
        expect(@subject2).to_not be_valid
      end

    end

  end

  describe 'authenticate_with_credentials' do

    before(:all) do
      @subject = User.create( name: 'Fred', password: '12345', password_confirmation: '12345', email: 'newemail@email.com')
    end

    it 'should return a user if email and password are valid' do
      expect(@subject.authenticate_with_credentials('newemail@email.com', '12345')).to be_a User
    end

    it 'should return a user if email has trailing or leading spaces' do
      expect(@subject.authenticate_with_credentials('   newemail@email.com   ', '12345')).to be_a User
    end

    it 'should return a user if email does not have exact case' do
      expect(@subject.authenticate_with_credentials('NeWeMaIl@email.COM', '12345')).to be_a User
    end

    it 'should return nil if email is invalid' do
      expect(@subject.authenticate_with_credentials('neweremail@email.com', '12345')).to be_nil
    end

    it 'should return nil if password is invalid' do
      expect(@subject.authenticate_with_credentials('newemail@email.com', '67890')).to be_nil
    end
  end

end
