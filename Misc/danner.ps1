# Specify the path to the CSV file
$csvFilePath = Read-Host "Enter filepath of CSV (like C:\folder\file.csv no quotations)" 

# Specify the folder containing the files to be renamed
$folderPath = Read-Host "Enter filepath of files to rename (C:\folder)"

# Import the CSV data
$renameData = Import-Csv -Path $csvFilePath

# Get a list of files in the specified folder
$files = Get-ChildItem -Path $folderPath -File


# Loop through each file and rename it based on the CSV data
foreach ($i in 0..($files.Count - 1)) { 
    # Get the current file
    $file = $files[$i] 

    # Get the new file name from the CSV row corresponding to the index
    $newFileName = $renameData[$i].RentalAddress + $renameData[$i].RentalUnit + $renameData[$i].RenterFirstName + $renameData[$i].RenterLastName

    # Rename the file
    Rename-Item -Path $file.FullName -NewName $newFileName 
}