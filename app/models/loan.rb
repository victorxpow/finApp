class Loan < ApplicationRecord
  belongs_to :requester

  validates :value, :fee, :month, presence: true
  validates :value, :fee, :month, numericality: true

  def pmt
    pmt = value*((((1 + (fee/100)) ** month) * (fee/100)) / (((1 + (fee/100)) ** month) - 1))
  end
end
