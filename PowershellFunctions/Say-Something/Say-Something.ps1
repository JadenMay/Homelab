Add-Type -AssemblyName System.speech
$poweroftalk = New-Object System.Speech.Synthesis.SpeechSynthesizer
Write-Host -ForegroundColor Red "What do you want to say, press 1 for a song: " -NoNewline
$say = Read-Host
if($say -eq "1"){
    $poweroftalk.rate = 4
    $rap = Get-Content D:\git\homelab\powershellfunctions\say-something\puffinonzooties.txt
    $poweroftalk.Speak("latency $rap")
}else{
    Write-host -ForegroundColor Green "Speed (-10 to 10): " -NoNewline
    $poweroftalk.rate = Read-Host
    $poweroftalk.Speak("latency $say")
}
