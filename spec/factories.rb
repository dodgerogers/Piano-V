FactoryGirl.define do
  factory :user do
    name "andy"
  end
  
  factory :post do
    song_name "thriller"
    song "eytyer rewtrt trtete"
    user
    rating 6
  end
  
  factory :comment do
    content "comment"
    user
    post
  end
  
  factory :rating do
    rating 6
    post
    user
  end
end