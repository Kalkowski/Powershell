#echo "Quali file vuoi spostare?"
#[string]$Estensione = Read-Host
$OrigineFile = "C:\Users\$env:UserName\Desktop"
$est = @("pdf", "txt", "jpg", "png", "7z","zip","docx","xls","rar","odt","msi","pptx","ppt","iso","doc")
$num=1
[int]$cont = 0

while ($cont -lt 15) {
    $Estensione = $est[$cont]
    $Destinazione = "d:\file\" + $est[$cont]
    New-Item -ItemType Directory -Force -Path $Destinazione
    Get-ChildItem -Path $OrigineFile -Filter *.$Estensione | ForEach-Object {
        
            $nextName = Join-Path -Path $Destinazione -ChildPath $_.name
        
            while(Test-Path -Path $nextName)
            {
               $nextName = Join-Path $Destinazione ($_.BaseName + "($num)" + $_.Extension)    
               $num+=1  
        
            }
            $num = 1
        
            $_ | Move-Item -Destination $nextName
            
        }
        $cont+=1    
}
