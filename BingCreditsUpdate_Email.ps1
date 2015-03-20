$From = "nathanurbanowski@gmail.com"
$To = "nathanurbanowski+bing@gmail.com"
$Subject = "Bing Status"
$Body = [IO.File]::ReadAllText("C:\Program Files (x86)\BingSearchBot\BingCredits.txt")
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$Password = get-content 'C:\Program Files (x86)\BingSearchBot\cred.txt' | convertto-securestring
$Credential = New-Object System.Management.Automation.PSCredential("nathanurbanowski@gmail.com",$Password)

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $Credential