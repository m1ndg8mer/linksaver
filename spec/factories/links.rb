FactoryBot.define do
  factory :link do |f|
    f.href { Faker::Lorem.word }
    f.description { Faker::Lorem.sentence }
    f.user { User.last }
  end
end
