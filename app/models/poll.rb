class Poll < ActiveRecord::Base
  has_many :vote_options, dependent: :destroy
  validates :topic, presence: true
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true
end
