$redis_client = Redis.new(driver: :hiredis)

$redis = Redis::Namespace.new('quizr', redis: $redis_client,
                                           deprecations: true)
