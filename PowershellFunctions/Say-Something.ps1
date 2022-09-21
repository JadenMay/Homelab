Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
Write-Host -ForegroundColor Red "What do you want to say: " -NoNewline
$say = Read-Host
$speak.Speak("latency $say")