class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :remember_created_at, type: Time

  has_many :links
end
