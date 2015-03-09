module Sales
	class << self
		def redis
			@redis ||= Redis.new(url: (ENV['REDISTOGO_URL'] || 'redis://127.0.0.1:6379'))
		end
	end
end

uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])