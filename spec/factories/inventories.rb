# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory do
    sequence(:title) {|n| "Thing#{n}"}
    description "MyText"
    quantity 1
  end
end
