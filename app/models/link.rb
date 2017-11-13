class Link
  include Mongoid::Document
  include AASM
  include Mongoid::Timestamps

  field :href, type: String
  field :description, type: String
  field :aasm_state

  validates :href, presence: true
  validates :description, length: { maximum: 200 }

  before_save :normalize_href, if: :invalid_format?

  belongs_to :user
  has_and_belongs_to_many :tags

  # User could share link to all user
  aasm do
    state :private, initial: true
    state :public

    event :share do
      transitions from: :private, to: :public
    end

    event :hide do
      transitions from: :public, to: :private
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.tagged_with(id)
    Link.where(tag_ids: id)
  end

  private

  def invalid_format?
    return true unless href =~ /^http/
    false
  end

  def normalize_href
    href.prepend('http://')
  end
end
