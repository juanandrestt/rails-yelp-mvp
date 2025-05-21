require "faker"

category = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  Restaurant.create!(name: Faker::Book.title, address: Faker::Address.full_address, phone_number: Faker::Number.number(digits: 10), category: category.sample  )
end
