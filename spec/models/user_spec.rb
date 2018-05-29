require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(
    name: 'Willie Dustice',
    email: 'willie@dustice.com',
    password: 'asdfghjk',
    password_confirmation: 'asdfghjk'
    )}

    context 'Validations' do
      it 'is valid if it has a name, email, password and confirmation' do
        expect(subject).to be_valid
        puts subject.errors.full_messages
      end

      it 'requires a name' do
        subject.name = nil
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(:name)
        puts subject.errors.full_messages
      end

      it 'requires an email' do
        subject.email = nil
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(:email)
        puts subject.errors.full_messages
      end

      it 'is not valid if password and confirmation do not match' do
        subject.password_confirmation = 'dfghjkl;'
        expect(subject).not_to be_valid
        puts subject.errors.full_messages
      end

      it 'is not valid if email is already taken' do
        subject.save
        subject2 = User.create(
          name: 'Bobson Dugnutt',
          email: 'willie@dustice.com',
          password: 'qwertyui',
          password_confirmation: 'qwertyui'
        )
        expect(subject2).not_to be_valid
        puts subject2.errors.full_messages
      end

      it 'is not valid password has fewer than 6 chars' do
        subject.password = 'asdf'
        subject.password_confirmation = 'asdf'
        expect(subject).not_to be_valid
        puts subject.errors.full_messages
      end

      context '#authenticate_with_credentials' do
        it 'returns the user if the user is authenticated' do
          subject.save
          user = User.authenticate_with_credentials('willie@dustice.com', 'asdfghjk')
          expect(user).to be_instance_of(User)
        end

        it 'saves with spaces around the email' do
          subject.save
          user = User.authenticate_with_credentials('  willie@dustice.com  ', 'asdfghjk')
          expect(user).to be_instance_of(User)
        end

        it 'saves if the email has caps' do
          subject.save
          user = User.authenticate_with_credentials('WILLIE@DUSTICE.COM', 'asdfghjk')
          expect(user).to be_instance_of(User)
        end
      end
  end
end
