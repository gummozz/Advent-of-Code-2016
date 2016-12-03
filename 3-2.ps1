#AOC 3
[int]$answer = 0
$i = 0
[array]$cleanRowOne =   $null
[array]$cleanRowTwo =   $null
[array]$cleanRowThree = $null

$instructions = "    4   21  894
  419  794  987
  424  797  125
  651  305  558
  655  631  963
    2  628  436
"
$instructionsArray = [string]$instructions -split '[\n]'

foreach ($instruction in $instructionsArray) {
    $instruction = $instruction -split '\s+'
    if ($i -eq 3) {
        if (

            (([int]$cleanRowOne[0] + [int]$cleanRowOne[1]) -gt [int]$cleanRowOne[2]) -and
            (([int]$cleanRowOne[0] + [int]$cleanRowOne[2]) -gt [int]$cleanRowOne[1]) -and
            (([int]$cleanRowOne[1] + [int]$cleanRowOne[2]) -gt [int]$cleanRowOne[0])


        ) {$answer++}

        if (

            (([int]$cleanRowTwo[0] + [int]$cleanRowTwo[1]) -gt [int]$cleanRowTwo[2]) -and
            (([int]$cleanRowTwo[0] + [int]$cleanRowTwo[2]) -gt [int]$cleanRowTwo[1]) -and
            (([int]$cleanRowTwo[1] + [int]$cleanRowTwo[2]) -gt [int]$cleanRowTwo[0])


        ) {$answer++}

        if (

            (([int]$cleanRowThree[0] + [int]$cleanRowThree[1]) -gt [int]$cleanRowThree[2]) -and
            (([int]$cleanRowThree[0] + [int]$cleanRowThree[2]) -gt [int]$cleanRowThree[1]) -and
            (([int]$cleanRowThree[1] + [int]$cleanRowThree[2]) -gt [int]$cleanRowThree[0])


        ) {$answer++}

    

        [array]$cleanRowOne =   $instruction[1]
        [array]$cleanRowTwo =   $instruction[2]
        [array]$cleanRowThree = $instruction[3]
        $i = 0

    }
    else {
    
        [array]$cleanRowOne +=   $instruction[1]
        [array]$cleanRowTwo +=   $instruction[2]
        [array]$cleanRowThree += $instruction[3]
        
    
    }

    $i++

}


$answer
