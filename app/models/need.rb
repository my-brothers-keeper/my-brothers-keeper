class Need < ApplicationRecord
  belongs_to :organization
  belongs_to :category

  validates :item, presence: true
end
