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

  validates :name, presence: true, uniqueness: true

  def mandatory_tasks
    tasks.select(&:mandatory)
  end

  def daily_rewards
    rewards.select(&:daily)
  end

  def completed_tasks
    tasks.count { |t| t.task_submissions.any? && t.task_submissions.last.state == 1 }
  end

  def done_all_mandatory?
    mandatory_tasks.any? && mandatory_tasks.all? { |t| t.task_submissions.any? ? t.task_submissions.last.state == 1 : false }
  end

  def progress
    completed_tasks.fdiv(mandatory_tasks.count).round(1)
  end

  def pending_submissions?
    if tasks.any? && task_submissions.any?
      tasks.select { |t| t.task_submissions.any? && t.task_submissions.last.state.zero? }.any?
    else
      false
    end
  end

  def pending_requests?
    if rewards.any? && reward_requests.any?
      rewards.select { |r| r.reward_requests.any? && r.reward_requests.last.state.zero? }.any?
    else
      false
    end
  end
end
