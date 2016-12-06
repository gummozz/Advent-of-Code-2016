[array]$tempArray = "","","","","","","","","","",""
"asasd" -split '\n' | % {for ($i = 0; $i -lt $_.ToChararray().length; $i++) {[array]$tempArray[$i] += [string]$_.ToCharArray()[$i]}}

$answer = $null
$tempArray | %{ $_ | Sort-Object | Group-Object | Sort-Object -Property Count -Descending | Select-Object name -last 2 | % {[string]$answer += [string]$_.name} }
$answer
