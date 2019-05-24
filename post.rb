require 'json'
require 'oauth'

consumer_key = ENV['TWITTER_CONSUMER_KEY']
consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
access_token = ENV['TWITTER_ACCESS_TOKEN']
access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']

# set token
client = OAuth::Consumer.new(consumer_key, consumer_secret, site: 'https://api.twitter.com/')
token = OAuth::AccessToken.new(client, access_token, access_token_secret)

# POST request
response = token.post('https://api.twitter.com/1.1/statuses/update.json', status: 'test3')

# dump HTTP response headers
response.each_header do |name, val|
  puts "name=#{name}, val=#{val}"
end

