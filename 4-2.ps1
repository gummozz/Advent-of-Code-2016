$instructions = "


bkwzkqsxq-tovvilokx-nozvyiwoxd-172[fstek]
wifilzof-wbiwifuny-yhachyylcha-526[qrazx]
jvyyvzpcl-jhukf-shivyhavyf-487[zhtsi]
kwvacumz-ozilm-kivlg-kwvbiqvumvb-694[gknyw]
mvhkvbdib-kmjezxodgz-mvwwdo-omvdidib-837[dmvbi]
nzydfxpc-rclop-qwzhpc-lnbftdtetzy-171[cptzd]
vhehkyne-unggr-inkvatlbgz-813[gnehk]




" -split '\n'


foreach ($instruction in $instructions) {
    
    

    if ($instruction -match '\[(.+?)\]') {
    
        $splittedInstruction = ($instruction -split '[\[]')[0]
        [int]$ID = ($splittedInstruction.Split('-')[(($splittedInstruction.Split('-')).length) -1])
        if($splittedInstruction) {
        $splittedInstructionWithoutID = $splittedInstruction.Replace($ID,'').replace('-',' ')
        }

        $charArray = $null
        $splittedInstructionWithoutID.ToCharArray() | % {[array]$charArray += [byte][char]$_}
        #$ID
        [string]$currentSentence = [string]$ID + "-"
        foreach ($char in $charArray) {
            #[string]$currentSentence
            [int]$tempChar = $char


            for ($i = $ID; $i -gt 0; $i--) {
                if ($tempChar -ne 32){
                    if ($tempChar -eq 122) {$tempChar = 97}
                    else {$tempChar++}
                }


            }
            #[char][int]$tempChar
           [string]$currentSentence += [char][int]$tempChar


        }

        if ($currentSentence -match "North|Pole|Objects"){
        $currentSentence
        }
    }

    
}
