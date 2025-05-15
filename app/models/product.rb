class Product < ApplicationRecord
  belongs_to :category

  has_many_attached :photos do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 80, 80 ]
  end
end
