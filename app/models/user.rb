class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, length: { minimum: 6, maximum: 32 }, format: { with: VALID_PASSWORD_REGEX }
    validates :nickname
    validates :last_name,
              format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
    validates :first_name,
              format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
    validates :last_name_kana,
              format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :first_name_kana,
              format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :birthday
  end

  has_many :items
  has_many :orders

end
