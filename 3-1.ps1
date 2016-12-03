#AOC 3
[int]$answer = 0

$instructions = "
  4   21  894
  419  794  987
  424  797  125
  651  305  558
"
$instructionsArray = [string]$instructions -split '[\n]'

foreach ($instruction in $instructionsArray) {
    $clean = $instruction -split "  "

    if (

        (([int]$clean[1] + [int]$clean[2]) -gt [int]$clean[3]) -and
        (([int]$clean[1] + [int]$clean[3]) -gt [int]$clean[2]) -and
        (([int]$clean[2] + [int]$clean[3]) -gt [int]$clean[1])


    ) {$answer++}



}


$answer
