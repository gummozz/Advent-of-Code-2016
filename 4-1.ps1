$instructions = "

vagreangvbany-enoovg-fuvccvat-533[gncot]

" -split '\n'

$checkSum = $null
$answer = 0


foreach ($instruction in $instructions) {


    if ($instruction -match '\[(.+?)\]') {

    [string]$checkSum = ($Matches[0]).replace('[','').replace(']','')

    }
    else {continue}



    $instructionWithoutDashes = $instruction.Replace('-','')
    $splittedInstruction = ($instruction -split '[\[]')[0]
    $numberAtTheEnd = ($splittedInstruction.Split('-')[(($splittedInstruction.Split('-')).length) -1])
    $instructionWithoutDashesOrNumbers = $instructionWithoutDashes.Replace($numberAtTheEnd,'')
    $instructionWithoutDashesOrNumbers = ($instructionWithoutDashesOrNumbers -split '[\[]' )[0]
    $temp1 = $null
    $temp2 = $null
    $temp3 = $null
    $temp4 = $null
    $improvedInstruction = $null
    $instructionWithoutDashesOrNumbers.tochararray() | foreach {if ($checksum -match $_){$improvedInstruction += $_}}


    #UGLY FIX
    $instructionWithoutDashesOrNumbers.tochararray() | Sort-Object | Group-Object | Sort-Object -Property "Count" -Descending | % {[string]$temp3 += $_.name}
    $temp3.ToCharArray() | Select-Object -First 1 | % {$temp4 += $_}
    #UGLY FIX

    if ($improvedInstruction.Length -gt 4) {
    $improvedInstruction.tochararray() | Sort-Object | Group-Object | Sort-Object -Property "Count" -Descending | % {[string]$temp1 += $_.name}
    $temp1.ToCharArray() | Select-Object -First 5 | % {$temp2 += $_}
    if($temp2 -eq $checkSum -and $temp2 -match $temp4) {$answer += $numberAtTheEnd
    Write-Host -ForegroundColor Green "The calculated checksum of $instruction is $temp2 and should be $checksum"
    }
    else {
    Write-Host -ForegroundColor Red "The calculated checksum of $instruction is $temp2 and it should be $checksum"
    }

    }


}

Write-host -ForegroundColor Green "The answer should be: $answer"
