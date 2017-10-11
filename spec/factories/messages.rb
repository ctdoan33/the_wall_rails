FactoryGirl.define do
  factory :message do
    message {('a'..'z').to_a.shuffle.join}
    user
  end
end
