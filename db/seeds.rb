User.create!(name:  "Drew",
             email: "druzi312@gmail.com",
             password:              "gambit312",
             password_confirmation: "gambit312",
             admin: true)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
