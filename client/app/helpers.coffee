Handlebars.registerHelper "moments", (date) ->
  moment(date).format "HH:mm:ss"

Handlebars.registerHelper "linkify", (tweet) ->
  out = tweet.text
  out = out.replace(/[A-Za-z]+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&~\?\/.=]+/g, (url) ->
    tweetText = url
    if tweet.entities.urls isnt `undefined` and tweet.entities.urls.length > 0
      myUrl = _.find(tweet.entities.urls, (urlObj) ->
        urlObj.url is url
      )
      tweetText = myUrl.display_url  if myUrl isnt `undefined` and myUrl isnt null
    tweetText.link url
  )
  out = out.replace(/[#]+[A-Za-z0-9-_]+/g, (hash) ->
    txt = hash.replace("#", "")
    hash.link "http://twitter.com/search/%23" + txt
  )
  out = out.replace(/[@]+[A-Za-z0-9-_]+/g, (u) ->
    username = u.replace("@", "")
    u.link "http://twitter.com/" + username
  )
  out
