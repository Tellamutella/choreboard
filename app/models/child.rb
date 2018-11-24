class Child < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  belongs_to :parent
  has_many :tasks, dependent: :destroy
  has_many :task_submissions, through: :tasks
  has_many :rewards, dependent: :destroy
  has_many :reward_requests, through: :rewards
end
