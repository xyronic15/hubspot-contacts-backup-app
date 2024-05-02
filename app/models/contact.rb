class Contact < ApplicationRecord
  validates :id, :created_at, :updated_at, presence: true
end
