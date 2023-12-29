class Database < ApplicationRecord
  validates :name, :community, presence: true
end
