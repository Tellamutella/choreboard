class Task < ApplicationRecord
  belongs_to :parent
  belongs_to :child

  has_many :task_submissions
end
