Twitter = Meteor.require("twitter")
TweetStream = new Meteor.Stream("tweets")
conf = JSON.parse(Assets.getText("twitter.json"))
twit = new Twitter(
  consumer_key: conf.consumer.key
  consumer_secret: conf.consumer.secret
  access_token_key: conf.access_token.key
  access_token_secret: conf.access_token.secret
)
twit.stream "statuses/filter",
  track: conf.hashtag
, (stream) ->
  stream.on "data", (data) ->
    TweetStream.emit "tweet", data
    return

  return
