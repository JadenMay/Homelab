#create x amount of whatever files
Write-Host "this script creates the files in whatever directory the cli is in, be careful"
$type = Read-Host -Prompt "type the file extension you want"
$howmany = Read-Host -Prompt "how many do you want (number)"
$i = 1
while($i -le $howmany){
    New-Item -Path C:\work\files -Name "$i.$type" -ItemType File
    $i++
}