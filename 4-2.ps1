$instructions = "



a-b-c-343[decoy]

" -split '\n'


foreach ($instruction in $instructions) {

    
    $splittedInstruction = ($instruction -split '[\[]')[0]
    #$ID = ($splittedInstruction.Split('-')[(($splittedInstruction.Split('-')).length) -1])
    [int]$ID = ($splittedInstruction.Split('-')[3])
    $ID
    if($splittedInstruction) {
    $splittedInstructionWithoutID = $splittedInstruction.Replace($ID,'').replace('-',' ')
    }

    $charArray = $null

    $splittedInstructionWithoutID.ToCharArray() | % {$charArray += [byte][char]$_}
    #$ID

    foreach ($char in $charArray) {

        [int]$tempChar = $char


        for ($i = $ID; $i -gt 0; $i--) {

            if ($tempChar -eq 122) {$tempChar = 99}
            else {$tempChar++}

        }
        [char][int]$tempChar


    }

}
