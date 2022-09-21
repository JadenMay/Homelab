Add-Type -AssemblyName System.speech

Write-Host -ForegroundColor Red "What do you want to say: " -NoNewline
$say = Read-Host

$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("$say")