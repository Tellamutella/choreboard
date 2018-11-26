class Reward < ApplicationRecord
  belongs_to :parent
  belongs_to :child
  has_many :reward_requests, dependent: :destroy
end
