if Rails.env.production?
  $redis = Redis.new(url: 'h:pff8a02b9d85bcd63022e16edd14efe9a7c472ad4b273c4172ea2d4967bd81855@ec2-34-206-56-13.compute-1.amazonaws.com:32859')
else
  $redis = Redis.new(:host => 'localhost', :port => 6379)
end

