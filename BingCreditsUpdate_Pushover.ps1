###clean the data####

$header = (Get-Content "C:\Program Files (x86)\BingSearchBot\BingCredits.txt")[0]
$header = $header.Replace("Collected","Cha")
$header = $header.Replace("Previous","Prev")
$header = $header.Replace("Current","Cur")
$header = $header.Replace("Time","")
$header = $header.Substring(14,20)
$header = $header.Insert(0,"Account/")

$accounts = (Get-Content "C:\Program Files (x86)\BingSearchBot\BingCredits.txt")[1 .. 5]
$accounts = $accounts.replace('@outlook.com=','/')
$accounts[0] = $accounts[0].replace('and87','a')
$accounts[2] = $accounts[2].replace('eldman85','e')
$accounts[4] = $accounts[4].replace('anow','a')

$footer = (Get-Content "C:\Program Files (x86)\BingSearchBot\BingCredits.txt")[7]
$footer = $footer.TrimStart("Time=")

$body = $header,$accounts,$footer
$body = $body.replace(', ','--')
$body = $body.replace('/','--')

###send the Pushover notifications####

$uri = "https://api.pushover.net/1/messages.json"
$parameters = @{
  token = "aKwdCGbw8zSCCuSKqPkxJee11PS9SX"
  user = "uLiMkDVhfFq7hkNk69dbxYsUFgcLmm"
  message = ($body | Out-String)
}
$parameters | Invoke-RestMethod -Uri $uri -Method Post