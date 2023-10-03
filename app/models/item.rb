class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliveryCost
  belongs_to :deliveryDay
  belongs_to :prefecture

  validates :image, :name, :description, presence: true
  validates :category_id, :condition_id, :deliveryCost_id, :prefecture_id, :deliveryDay_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, in: 300..9999999, message: 'is invalid' }
end
