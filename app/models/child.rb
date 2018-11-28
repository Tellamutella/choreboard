class Child < ApplicationRecord
  attr_reader :completed_tasks, :done_all_mandatory
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  belongs_to :parent
  has_many :tasks, dependent: :destroy
  has_many :task_submissions, through: :tasks
  has_many :rewards, dependent: :destroy
  has_many :reward_requests, through: :rewards

  validates :name, presence: true, uniqueness: true

  def completed_tasks
    tasks.count { |t| t.task_submissions.any? && t.task_submissions.last.state == 1 }
  end

  def done_all_mandatory?
    list = tasks.select(&:mandatory)
    list.any? && list.all? { |t| t.task_submissions.any? ? t.task_submissions.last.state == 1 : false }
  end
end
