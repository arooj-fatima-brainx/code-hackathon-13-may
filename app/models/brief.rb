class Brief < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
