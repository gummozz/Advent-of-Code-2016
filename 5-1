#day 5


$someString = "reyedfim"
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$utf8 = new-object -TypeName System.Text.UTF8Encoding
$i = 0
$passwordCounter = 0
[string]$password = $null
while ($true) {
    $someString2 = $someString + [string]$i
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString2)))

    if ($hash.Replace("-",'') -match '^00000') {

        if ($passwordCounter -lt 8){
            $password += [string]($hash.Split("-")[2]).toCharArray()[1]
            $passwordCounter++
        }
        else {$password;break}
    }
    $i++

}
