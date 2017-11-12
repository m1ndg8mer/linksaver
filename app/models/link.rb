class Link
  include Mongoid::Document
  include AASM
  include Mongoid::Timestamps

  field :href, type: String
  field :description, type: String
  field :aasm_state

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
end
