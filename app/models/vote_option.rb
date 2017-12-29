class VoteOption < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  belongs_to :poll
  has_many :votes, dependent: :destroy
  validates :titles, presence: true
end
