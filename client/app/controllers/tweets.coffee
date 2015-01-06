TweetStream = new Meteor.Stream("tweets")
TweetStream.on "tweet", (tweet) ->
  tweet.created_at = moment(tweet.created_at).toDate()
  console.log tweet
  Tweets.insert tweet
  return

Template.tweets.tweets = ->
  Tweets.find {},
    sort:
      created_at: -1


Template.tweets.isPhoto = ->
  @type is "photo"