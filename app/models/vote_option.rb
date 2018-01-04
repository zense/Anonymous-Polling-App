class VoteOption < ActiveRecord::Base
  belongs_to :poll
  has_many :votes, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  validates :titles, presence: true
end
