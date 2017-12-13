FactoryBot.define do
  factory :contact do
    sequence(:name) {|n| "Name#{n}"}
    sequence(:position) {|n| "Position#{n}"}
    sequence(:email) {|n| "Email#{n}"}
    company
  end
end