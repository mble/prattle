require 'ffaker'
20.times do
  date1 = Time.current
  date2 = Time.current - 15.months
  created = Time.zone.at (date2.to_f - date1.to_f) * rand + date1.to_f
  Post.create content: FFaker::Lorem.sentence, created_at: created
end
