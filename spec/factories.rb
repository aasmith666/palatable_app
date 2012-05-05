Factory.define :user do |user|
	user.username 					"Allison"
	user.real_name					"Allison Smith"
	user.email						"asmith@example.com"
	user.password					"ratfink666"
	user.password_confirmation 		"ratfink666"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :username do |n|
  "Person #{n}"
end

Factory.define :bookmark do |bookmark|
  bookmark.name "Foo bar"
  bookmark.url "http://www.fakesite.com"
  bookmark.association :user
end