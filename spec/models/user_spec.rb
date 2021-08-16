# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'relations' do    
    it { is_expected.to have_many(:posts).dependent(:destroy) }    
  end

  context 'validations' do
    [:email].each do |field|
      it { is_expected.to validate_presence_of(field) }    
    end    

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
  
   it do
    should validate_length_of(:password).
      is_at_least(4).
      with_message("Password isn't long enough")
  end
end
