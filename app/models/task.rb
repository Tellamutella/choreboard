class Task < ApplicationRecord
  belongs_to :parent
  belongs_to :child

  has_many :task_submissions, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :objective, presence: true, uniqueness: { scope: :child }

  def completed?
    task_submissions.any? && task_submissions.last.state == 1
  end
end
