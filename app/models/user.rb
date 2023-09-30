class User < ApplicationRecord
 validates :nickname, presence: true
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :first_name_kana, presence: true
 validates :last_name_kana, presence: true
 validates :birthday, presence: true

 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
