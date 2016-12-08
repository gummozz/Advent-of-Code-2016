
[array]$display = @(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),@(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),@(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),@(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),@(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),@(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)



$instructions = "rect 5x3
rotate column x=1 by 1
rotate row y=0 by 4" -split '\n'



foreach ($instruction in $instructions) {


    switch -Regex ($instruction) {
    
    
    
    'rect.*' {
    
        $x = [int](($instruction -split '\s')[1] -split 'x')[0]
        $y = [int](($instruction -split '\s')[1] -split 'x')[1]



        for ($i = 0; $i -lt $y; $i++) {

            for ($c = 0; $c -lt $x; $c++) {
                $display[$i][$c] = 1
            }


        }
        


    }
    'rotate column.*' {
    
        $x = [int](($instruction -split '\s')[2] -split '=')[1]
        $times = [int]($instruction -split '\s')[4]
    
    }
    'rotate row.*' {
    
        #($instruction -split '\s')[2]
        #($instruction -split '\s')[4]
    
    }

    
    
    }



}

-join $display[0]
-join $display[1]
-join $display[2]
-join $display[3]
-join $display[4]
-join $display[5]




