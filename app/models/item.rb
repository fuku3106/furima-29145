class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_area
  belongs_to :shipping

  belongs_to :user
  has_one_attached :image

  with_options presence: true do

  validates :name, :description, :price, :image

  validates :price,
  format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
  greater_than: 300, less_than: 10000000 } 

  validates :category_id, :condition_id, :days_to_ship_id, :delivery_area_id, :shipping_id, numericality: { other_than: 1 } 
  end
end
