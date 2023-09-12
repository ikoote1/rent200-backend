class Product < ApplicationRecord
  belongs_to :owner
  belongs_to :category
  belongs_to :family
  belongs_to :place
  belongs_to :period
end
