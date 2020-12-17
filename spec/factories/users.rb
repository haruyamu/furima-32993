FactoryBot.define do
  factory :user do
    nick_name {"haru"}
    email {Faker::Internet.free_email}
    password {"haruya0331"}
    password_confirmation { password } 
    birthday {"1930-03-31"}
    first_name {"晴哉"}
    last_name {"村田"}
    first_name_kana {"ハルヤ"}
    last_name_kana{"ムラタ"}
  end
end
