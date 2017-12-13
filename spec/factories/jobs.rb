FactoryBot.define do
  factory :job do
    sequence(:name) {|n| "Job#{n}"}
    sequence(:level_of_interest) {|n| n}
    sequence(:city) {|n| "City#{n}"}
  end
end