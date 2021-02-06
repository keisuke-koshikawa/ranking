class Department < ApplicationRecord
  belongs_to :company
  has_many :employees
  has_ancestry cache_depth: true
end
