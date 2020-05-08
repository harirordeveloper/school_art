class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # acts_as_token_authenticatable
  devise :doorkeeper

  has_many :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
