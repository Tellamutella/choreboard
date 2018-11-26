class Task < ApplicationRecord
  belongs_to :parent
  belongs_to :child

  has_many :task_submissions, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :objective, presence: true, uniqueness: { scope: :child }
end
