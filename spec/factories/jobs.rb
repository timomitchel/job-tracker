FactoryBot.define do
  factory :job do
    sequence(:title) {|n| "Job#{n}"}
    sequence(:level_of_interest) {|n| n}
    sequence(:city) {|n| "City#{n}"}
    company
  end
end