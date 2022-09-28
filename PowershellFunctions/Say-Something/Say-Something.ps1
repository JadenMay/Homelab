#Imports
Add-Type -AssemblyName System.speech
$poweroftalk = New-Object System.Speech.Synthesis.SpeechSynthesizer

#Song List
Write-Host -ForegroundColor Green "
Song List:
1 - Puffin On Zooties
2 - Knife Talk"

#Get the pick
Write-Host -ForegroundColor Red "What do you want to say: " -NoNewline
$input = Read-Host

#Logic
if($input -eq "1"){
    #Puffin On Zooties
    $poweroftalk.rate = 4
    $rap = Get-Content D:\git\homelab\powershellfunctions\say-something\puffinonzooties.txt
}elseif($input -eq "2"){
    #Knife Talk
    $poweroftalk.rate = 2
    $rap = Get-Content D:\git\homelab\powershellfunctions\say-something\knifetalk.txt
}else{
    #User Inputted
    Write-host -ForegroundColor Green "Speed -10 to 10 (default is 0): " -NoNewline
    $yerrr = Read-Host
    if($yerrr -eq ""){
        $poweroftalk.rate = 0
    }
    else{
        $poweroftalk.rate = $yerrr
    }
    $rap = $input
}

#Say it
$poweroftalk.Speak($rap)
