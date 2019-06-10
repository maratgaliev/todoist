50.times do
  Task.create!(
    title: Faker::Book.title
  )
end