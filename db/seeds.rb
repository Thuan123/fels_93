User.create!(name: "Cao-Phuong-Anh", email: "thuanbk56@gmail.com",
  password: "pa0974340719", password_confirmation: "pa0974340719",
  admin_digest: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end

15.times do |n|
  name = "Basic #{n+1}"
  des = "study with me"
  Category.create!(name: name, description: des)
end
