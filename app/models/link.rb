class Link
  include Mongoid::Document
  include AASM
  include Mongoid::Timestamps

  field :href, type: String
  field :description, type: String
  field :aasm_state

  validates :href, presence: true
  validates :description, length: { maximum: 100 }

  before_save :normalize_href, if: :invalid_format?

  belongs_to :user

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

  private

  def invalid_format?
    return true unless self.href =~ /^http/
    false
  end

  def normalize_href
    self.href = 'http://' + self.href
  end
end
