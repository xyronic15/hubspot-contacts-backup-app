class Contact < ApplicationRecord
  validates :id, :email, :created_at, presence: true
end
