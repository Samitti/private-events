FactoryBot.define do
  factory :event do
    name { 'BD' }
    description { 'BD' }
    location { 'DB' }
    starts_at { '2020-01-26 16:43:35' }
    creator { User.first }
  end
end
