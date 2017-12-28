class VoteOption < ActiveRecord::Base
  belongs_to :poll
  has_many :votes, dependent: :destroy
  validates :titles, presence: true
end
