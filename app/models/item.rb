class Item < ApplicationRecord
  VALID_PRICE_REGEX = /\A\d\z/

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
  validates :price, presence: true, numericality: { in: 300..9999999, message: 'out of setting range' },
            format: { with: VALID_PRICE_REGEX, message: 'is invalid. Input half-width characters' }
end
