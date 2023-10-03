class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :prefecture

  validates :image, :name, :description, presence: true
  validates :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, in: 300..9999999, message: 'is invalid' }
end
