class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :department
  belongs_to :position
  has_many :orders

  enum sex: { male: false, female: true }
end
