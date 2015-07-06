class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_enumeration_for :role, with: UserRole, create_helper: true, required: true
end
