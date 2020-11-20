class Requester < ApplicationRecord
  has_many :loans, dependent: :destroy

  validates :company_name, :cnpj, :address, :phone, presence: true
  validates :company_name, :cnpj, uniqueness: true
end
