#Var
$Prepend = @'

# Contributors: Lord Roscoford


'@

$Pattern = "Sunday"

#Gathering File
$AllFiles = Get-ChildItem . -exclude *.dds,*.png,*.ps1 -recurse -file
# treatment
foreach ($File in $AllFiles)
{
    # Gathering Content
    $FileContent = Get-Content -Path $file.FullName -Raw
    $FileContent = '# ' + $file.Name + $Prepend + $FileContent
    Write-Host "The file $( $File.fullname ) has been modified" -ForegroundColor Green
    Set-Content -Path $File.FullName -value $FileContent
}
