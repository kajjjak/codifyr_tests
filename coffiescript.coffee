apikey = "YOUR GOOGLE API KEY GOES HERE"
 
shorten_url = (url, success_callback, error_callback) ->
 
  xhr = Titanium.Network.createHTTPClient()
  xhr.open "POST", "https://www.googleapis.com/urlshortener/v1/url?key=" + apikey
  xhr.setRequestHeader "Content-type", "application/json"
  xhr.onload = () -> success_callback xhr.status, xhr.responseText
  xhr.onerror = () -> error_callback xhr.status, xhr.responseText
  content =  "{\"longUrl\": \"#{url}\"}"
  xhr.send content
  