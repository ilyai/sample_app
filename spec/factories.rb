
FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do |user|
    user.name "Foo Bar"
    user.email "foo@bar.com"
    user.password "foobar"
    user.password_confirmation "foobar"
  end
  factory :micropost do |micropost|
    micropost.content "Foo bar"
    micropost.association :user
  end
end
