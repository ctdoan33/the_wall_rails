FactoryGirl.define do
	factory :comment do
	  comment {('a'..'z').to_a.shuffle.join}
	  user
	  message
	end
end
