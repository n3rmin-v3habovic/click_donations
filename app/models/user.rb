class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable,
         validate_on_invite: true

  auto_strip_attributes :first_name, :last_name, :email

  # VALIDATIONS
  validates :password, presence: true,
            length: { in: 8..20 },
            if: :password_required?
  validates_confirmation_of :password
  validates :email, email: true, uniqueness: true
end
