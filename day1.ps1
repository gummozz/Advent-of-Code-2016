[string]$in = "L1, L3, L5, L3, R1, L4, L5, R1, R3, L5, R1, L3, L2, L3, R2, R2, L3, L3, R1, L2, R1, L3, L2, R4, R2, L5, R4, L5, R4, L2, R3, L2, R4, R1, L5, L4, R1, L2, R3, R1, R2, L4, R1, L2, R3, L2, L3, R5, L192, R4, L5, R4, L1, R4, L4, R2, L5, R45, L2, L5, R4, R5, L3, R5, R77, R2, R5, L5, R1, R4, L4, L4, R2, L4, L1, R191, R1, L1, L2, L2, L4, L3, R1, L3, R1, R5, R3, L1, L4, L2, L3, L1, L1, R5, L4, R1, L3, R1, L2, R1, R4, R5, L4, L2, R4, R5, L1, L2, R3, L4, R2, R2, R3, L2, L3, L5, R3, R1, L4, L3, R4, R2, R2, R2, R1, L4, R4, R1, R2, R1, L2, L2, R4, L1, L2, R3, L3, L5, L4, R4, L3, L1, L5, L3, L5, R5, L5, L4, L2, R1, L2, L4, L2, L4, L1, R4, R4, R5, R1, L4, R2, L4, L2, L4, R2, L4, L1, L2, R1, R4, R3, R2, R2, R5, L1, L2"
$currentOrientation = "North"
$x = 0
$y = 0
[array]$b = $null


$1 = $in.Split(", ")


foreach ($stuff in $1) {
    #$currentOrientation
    if (!($stuff -match "\d")) {
        continue
    }

    if($stuff -match "\d+"){
        [int]$stepsToMove = $Matches[0]
    }

    else {}

    if ($stuff -match "R") {


    
    switch ($currentOrientation) {

        North {$currentOrientation = "East"}
        East {$currentOrientation = "South"}
        South {$currentOrientation = "West"}
        West {$currentOrientation = "North"}

    }



    }

    elseif ($stuff -match "L"){


    switch ($currentOrientation) {

        North {$currentOrientation = "West"}
        East {$currentOrientation = "North"}
        South {$currentOrientation = "East"}
        West {$currentOrientation = "South"}

    }


    }

    switch ($currentOrientation) {

        North {
        

            #$y += $stepsToMove

            for ($stepsToMove -gt 0; $stepsToMove--) {
                $y += 1
                [array]$b += [string]$x +","+[string]$y

            }


        
        }

        East {
        

            #$x += $stepsToMove

            for ($stepsToMove -gt 0; $stepsToMove--) {
                $x += 1
                [array]$b += [string]$x +","+[string]$y
            }

        }

        South {
        
        
            #$y -= $stepsToMove

            for ($stepsToMove -gt 0; $stepsToMove--) {
                $y -= 1
                [array]$b += [string]$x +","+[string]$y
            }

        }

        West {

        
            #$x -= $stepsToMove

            for ($stepsToMove -gt 0; $stepsToMove--) {
                $x -= 1
                [array]$b += [string]$x +","+[string]$y
            }

        }

    }
    


}


    if ($x -lt 0) {
        $x = ($x * (-1))

    }
    if ($y -lt 0) {
        $y = ($y * (-1))

    }

    "First answer: " + ($x + $y)

$a = $null


:outer foreach ($c in $b) {
    foreach ($d in $a) {
        if($c -eq $d) {

        [int]$x = [int]$c.Split(",")[0]
        [int]$y = [int]$c.Split(",")[1]


        if ($x -lt 0) {
        $x = ($x * (-1))

        }
        if ($y -lt 0) {
            $y = ($y * (-1))

        }
            "Second answer: " + ($x + $y)
            break outer
            }
    }
    $a += $c
}
