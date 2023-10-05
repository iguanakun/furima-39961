class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  validates :birthday, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
end
