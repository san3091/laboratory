class Run < ApplicationRecord
  belongs_to :experiment
  has_many :results, dependent: :destroy
  validates :title, presence: true
end
