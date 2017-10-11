FactoryGirl.define do
  factory :user do
	username {('a'..'z').to_a.shuffle[0,8].join}
  end
end
