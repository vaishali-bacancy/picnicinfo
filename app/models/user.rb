class User < ApplicationRecord
  rolify
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	after_create :assign_default_rolt_to_user

 	def assign_default_rolt_to_user
 		add_role(:user)
 	end

def admin?
  has_role?(:admin)
end

def user?
  has_role?(:user)
end 
end
