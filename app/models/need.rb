class Need < ApplicationRecord
  belongs_to :organization

  validates :item, presence: true
end
