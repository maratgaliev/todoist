FactoryBot.define do
  factory :task do
    sequence(:title) {|n| "Task Title #{n}"}
  end
end