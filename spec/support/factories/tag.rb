FactoryBot.define do
  factory :tag do
    sequence(:title) {|n| "Tag Title #{n}"}
  end
end