[int]$answer = 0
$instructions = "" -split '\n'


foreach ($instruction in $instructions) {

    if (($instruction -match '(.)(.)\2\1' -and $instruction -notmatch '\[\w+(.)(.)\2\1\w+\]' -and $instruction -notmatch '\[\w+(.)(.)\2\1\]' -and $instruction -notmatch '\[(.)(.)\2\1\w+\]' -and $instruction -notmatch '\[(.)(.)\2\1\]' -and $instruction -notmatch '(.)\1\1\1')) {$answer++;$instruction}

}

$answer



