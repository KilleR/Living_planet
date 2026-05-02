$allLanguages = @('braz_por', 'french', 'german', 'japanese', 'korean', 'polish', 'russian', 'simp_chinese', 'spanish')
$sourceLanguage = 'english'

$encoding =[Text.Encoding]::GetEncoding('utf-8')

$sourceName = '*'+$args[0]+'*'

$sourceFile = (Get-ChildItem . -recurse -include $sourceName)[0]

Write-Host "The source file is $($sourceFile)"

$sourceContent = Get-Content $sourceFile -raw

foreach ($language in $allLanguages)
{
    $newFile = "$($sourceFile.FullName.Replace($sourceLanguage, $language))"
    $fileContent = $sourceContent.Replace('l_english', 'l_'+$language);
    New-Item -Path $newFile -Force
    [System.IO.File]::WriteAllLines($newFile, $fileContent, $encoding)
}
