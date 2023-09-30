FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name {person.first.kanji}
    last_name {person.last.kanji}
    first_name_kana {person.first.katakana}
    last_name_kana {person.last.katakana}
    birthday {Faker::Date.backward }

  end
end