FactoryBot.define do
  factory :category do
    sequence(:title) {|n| "Sales#{n}"}
  end
end