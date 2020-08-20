class Experiment < ApplicationRecord
  has_many :runs, dependent: :destroy
  validates :title, presence: true
end
