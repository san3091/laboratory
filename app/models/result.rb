class Result < ApplicationRecord
  belongs_to :run
  validates :data, presence: true
end
