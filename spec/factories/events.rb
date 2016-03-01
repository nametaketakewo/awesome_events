FactoryGirl.define do
  factory :event do
    owner
    sequence(:name) { |i| "イベント#{i}" }
    sequence(:place) { |i| "場所#{i}" }
    sequence(:content) { |i| "内容#{i}" }
    start_time { rand(10..30).days.from_now }
    end_time { start_time + rand(10..30).hours }
  end
end
