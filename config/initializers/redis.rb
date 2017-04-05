if Rails.env.production?
  host = "redis://h:p58f5ee7ecfc4d469128c7907200ebd833d63b36606e7ec1206701241400d0239@ec2-34-206-56-5.compute-1.amazonaws.com:34009"
  $redis = Redis.new(:host => host)
else
  $redis = Redis.new(:host => 'localhost', :port => 6379)
end
