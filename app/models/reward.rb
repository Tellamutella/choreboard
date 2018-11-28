class Reward < ApplicationRecord
  belongs_to :parent
  belongs_to :child
  has_many :reward_requests, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :child }
  validates :category, presence: true

  def icon
    #  %w[Gaming Entertainment Outdoor Allowance Tablet Event Other]
    case category
    when 'Gaming'
      'gaming'
    when 'Entertainment'
      'tv'
    when 'Outdoor'
      'cycling'
    when 'Allowance'
      'dollar'
    when 'Tablet'
      'ipad'
    when 'Event'
      'balloons'
    else
      'Otherrrrrr'
    end
  end
end
