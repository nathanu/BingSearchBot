$uri = "https://api.pushover.net/1/messages.json"
$parameters = @{
  token = "aKwdCGbw8zSCCuSKqPkxJee11PS9SX"
  user = "uLiMkDVhfFq7hkNk69dbxYsUFgcLmm"
  message = [IO.File]::ReadAllText("C:\Program Files (x86)\BingSearchBot\BingCredits.txt")
}
$parameters | Invoke-RestMethod -Uri $uri -Method Post