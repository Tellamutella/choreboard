class TaskSubmission < ApplicationRecord
  belongs_to :task
  belongs_to :reward_request
end
