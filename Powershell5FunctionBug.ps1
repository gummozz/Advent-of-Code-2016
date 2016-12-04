$instructions = "
aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
" -split '\n'

$checkSum = $null
$answer = 0


foreach ($instruction in $instructions) {


    if ($instruction -match '\[(.+?)\]') {

    [string]$checkSum = ($Matches[0]).replace('[','').replace(']','')

    }
    else {continue}

    $splittedInstruction = ($instruction -split '[\[]')[0]

    function validate {
        param([int]$a)
        $lastOne = 0
        [string]$checkSumCheck = $null
        $splittedInstructionInFunction = $splittedInstruction.Split('-')[$a]
        $checkSumCharArray = $checkSum.ToCharArray()[$a]
        $splittedInstructionInFunction.tochararray() | Sort-Object | Group-Object | Sort-Object -Property "Count" -Descending  | foreach {
                
        if ($lastOne -gt $_.count){}
        else{
            $lastOne = $_.count
            [string]$checkSumCheck += $_.name;
        }
        
            
        }

        $checkSumCheck.ToCharArray() | Sort-Object | foreach {

            [string]$checkSumCheckCharArraySorted += $_

        }
        
        #$unCommentThisToTryTheBug
        
        if ($checkSumCheckCharArraySorted -match $checkSumCharArray) {

            #Write-Host -ForegroundColor Green $checkSumCheck contains $checkSumCharArray
            return $true

        }
        else {
        
            #Write-Host -ForegroundColor Red $checkSumCheck does not contain $checkSumCharArray
            return $false
        
        }


    }

    for ($i=0;$i -lt 5; $i++){
        if(validate $i) {
            
            if ($i -eq 4) {
                Write-host -ForegroundColor Green "$instruction looks good!"
                $length = (($splittedInstruction.Split('-')).length) -1
                $answer += $splittedInstruction.Split('-')[$length]
            }

        }
        else {

            break

        }
    }


}

$answer
