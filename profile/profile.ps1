s
$USER = [Environment]::UserName
$ROOT = $False
$files = "aliases","prompt"#,"exports","extra","functions","prompt"
if (($IsLinux) -xor ($IsMacOS)) {
  $userPath = logname
  $filePath = "/home/$userPath/PowerShell/"
  #Check to see if root
  if ($USER -eq "root"){
    $ROOT = $True
  }
} elseif ($IsWindows) {
  $filePath = "$HOME\Documents\PowerShell\"
  #Check to see if running as Admin
  if (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
    $ROOT = $True
  }
}

foreach ($file in $files) {
  $sourcePath = Join-Path -Path $filePath -ChildPath $file".ps1"
  . $sourcePath
}
