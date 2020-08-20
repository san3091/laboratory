class Run < ApplicationRecord
  belongs_to :experiment
  validates :title, presence: true
end
