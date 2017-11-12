class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :remember_created_at, type: Time

  has_many :links

  # return tags that user used
  def tags
    Tag.where(:_id.in => self.links.distinct(:tag_ids))
  end
end
