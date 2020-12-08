FactoryBot.define do
  factory :trudy_trends_floor do
    average_queue_size_top { 1 }
    average_queue_size_bot { 1 }
    average_queue_time_top { "9.99" }
    average_queue_size_bot { "9.99" }
  end
end
