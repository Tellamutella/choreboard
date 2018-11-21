class Child < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :parent
  has_many :task_submissions
  has_many :tasks
  has_many :reward_requests, through: :rewards
  has_many :rewards, through: :tasks
end
