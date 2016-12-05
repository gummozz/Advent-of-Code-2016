#day 5 MORE CINEMATIC but does not work in ISE


$someString = "reyedfim"
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$utf8 = new-object -TypeName System.Text.UTF8Encoding
$i = 0
$position1 = $null
$passwordCounter = 0
[string]$output = $null
[string]$output2 = $null
[array]$password = "_","_","_","_","_","_","_","_"
while ($true) {
    $someString2 = $someString + [string]$i
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString2)))

    if ($i % 999 -eq 0) {
    
    [string]$output2 = $null
            for ($a = 0; $a -lt 8; $a++){

                if ($password[$a] -eq "_") {

                    [string]$output2 += (Get-Random -Minimum 1 -Maximum 9)

                }
                else {[string]$output2 += $password[$a]}

            }
            

            Write-host -ForegroundColor Green "`r$hash`n`rPassword is: $output2" -NoNewline
            
            
    }

    if ($hash.Replace("-",'') -match '^00000[0-7]') {

        [string]$output = $null
        [string]$output2 = $null
        $position1 = $hash.split("-")[2].ToCharArray()[1]
        [int]$intNum = [convert]::ToInt32($position1, 10)

        if ($password[$intNum] -eq "_") {

            $character = ($hash.Split("-")[3]).toCharArray()[0]
            $password[$intNum] = $character
            $password | % {[string]$output += $_}

        }
    }
    $i++

}
