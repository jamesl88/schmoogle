FactoryGirl.define do
  factory :activity do
    name "MyString"
    scheduled_at DateTime.now
    location "MyString"
  end
end
