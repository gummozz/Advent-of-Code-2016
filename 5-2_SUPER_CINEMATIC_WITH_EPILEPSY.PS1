#day 5 MORE CINEMATIC


$someString = "reyedfim"
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$utf8 = new-object -TypeName System.Text.UTF8Encoding
$i = 1617990
$position1 = $null
$passwordCounter = 0
[string]$output = $null
[string]$output2 = $null
[array]$password = "_","_","_","_","_","_","_","_"
#[Array]$password = $password.ToCharArray()
while ($true) {
    $someString2 = $someString + [string]$i
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString2)))

    if ($i % 9999 -eq 0) {
    cls
    [string]$output2 = $null
            for ($a = 0; $a -lt 8; $a++){

                if ($password[$a] -eq "_") {

                    [string]$output2 += (Get-Random -Minimum 1 -Maximum 9)

                }
                else {[string]$output2 += $password[$a]}

            }
            
            "Current hash: " + $hash
            "Last character: " + $character
            "Last position: " + $position1


            Write-host -ForegroundColor Green "Password is: $output2"

    }


    if ($hash.Replace("-",'') -match '^00000[0-7]') {

        [string]$output = $null
        [string]$output2 = $null
        $position1 = $hash.split("-")[2].ToCharArray()[1]
        [int]$intNum = [convert]::ToInt32($position1, 10)

        if ($password[$intNum] -eq "_") {
            #cls

            $character = ($hash.Split("-")[3]).toCharArray()[0]
            #Write-Host -ForegroundColor Green "Found a match!"
            #"Hash:" + $hash
            #"Character:" + $character
            #"Position:" + $position1
        
            $password[$intNum] = $character
 
            $password | % {[string]$output += $_}
            #Write-host -ForegroundColor Green "Password is: $output"
            


        }
    }
    $i++

}
