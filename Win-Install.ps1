if ($PSVersionTable.PSVersion.Major -lt "7") {
  $confirmation = Read-Host "This profile requires Powershell 7 would you like to install it? Y/N"
  if ("$confirmation".ToLower() -eq 'y') {
      iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
      "Please start PowerShell 7 as Administrator and run this script again to install this profile."
  }
} else {
  $dPath = Join-Path -Path $HOME -ChildPath "\Documents"
  $sshPath = Join-Path -Path $dPath -ChildPath "\.ssh"
  $pshPath = Join-Path -Path $dPath -ChildPath "\PowerShell"
  $profilePath = Join-Path -Path $HOME -ChildPath "\PowerShell-profile"

  if (!(Test-Path $pshPath)){
    New-Item -ItemType directory -Path $pshPath
  }
  Get-ChildItem -Path "$profilePath\profile" -Recurse | Move-Item -Destination $pshPath -Force

  if (Test-Path $sshPath){
    if (!(Test-Path $sshPath"\.config")){
      Move-Item -Path "$profilePath\.ssh\.config" -Destination $sshPath -Force
    }
  } else {
    Move-Item -Path "$profilePath\.ssh" -Destination $sshPath -Force
  }
}
