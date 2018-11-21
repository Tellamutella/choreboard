class TaskSubmission < ApplicationRecord
  belongs_to :child
  belongs_to :task
  belongs_to :reward_request, optional: true
  mount_uploader :photo, PhotoUploader
end
