# Specify the path to the CSV file
$csvFilePath = Read-Host "Enter filepath of CSV (like C:\folder\file.csv no quotations)" 

# Specify the folder containing the files to be renamed
$folderPath = Read-Host "Enter filepath of files to rename (C:\folder no quotations)"

# Import the CSV data
$renameData = Import-Csv -Path $csvFilePath

# Get a list of files in the specified folder
$files = Get-ChildItem -Path $folderPath -File | Sort-Object { [int]($_.BaseName -replace '.*?(\d+)', '$1') } #crazy regex to sort files correctly
# Loop through each file and rename it based on the CSV data
foreach ($i in 0..($files.Count - 1)) { 
    $file = $files[$i] #make it easy to read
    $currentRename = $renameData[$i] #easy to read
    $rentalAddress = $currentRename.RentalAddress
    $rentalUnit = $currentRename.RentalUnit
    $renterFirst = $currentRename.RenterFirstName
    $renterLast = $currentRename.RenterLastName
    $draftFilename = "$rentalAddress $rentalUnit $renterFirst $renterLast.pdf"
    $trimmedFilename = $draftFilename.Replace("  ", " ")

    $newFileName = $trimmedFilename

    if(Test-Path -Path $folderPath\$newFileName){
        $filenamebeforeEdit = $newFileName
        $texttoinsert = "(1)"
        $filefinal = $filenamebeforeEdit.Insert($filenamebeforeEdit.LastIndexOf("."), $texttoinsert)
        write-host $filefinal
        Rename-Item -Path $file.FullName -NewName $filefinal
    }else{
        Rename-Item -Path $file.FullName -NewName $newFileName
    }
}
