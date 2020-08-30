$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
$Host.UI.RawUI.ForegroundColor = 'white'
$Host.PrivateData.ErrorForegroundColor = 'DarkRed'
$Host.PrivateData.ErrorBackgroundColor = $bckgrnd
$Host.PrivateData.WarningForegroundColor = 'Cyan'
$Host.PrivateData.WarningBackgroundColor = $bckgrnd
$Host.PrivateData.DebugForegroundColor = 'Yellow'
$Host.PrivateData.DebugBackgroundColor = $bckgrnd
$Host.PrivateData.VerboseForegroundColor = 'Green'
$Host.PrivateData.VerboseBackgroundColor = $bckgrnd
$Host.PrivateData.ProgressForegroundColor = 'Blue'
$Host.PrivateData.ProgressBackgroundColor = $bckgrnd

$txtColor = 'DarkRed'
#Checks the OS
if ($IsLinux) {
  $osColor = 'Green'
  $usrColor = 'Green'
} elseif ($IsMacOS) {
  $osColor = 'Red'
} elseif ($IsWindows) {
  $osColor = 'Cyan'
} else {
  $osColor = 'White'
}

#Checks if Remote-Session --unverified
if ($PSSenderInfo) {
  $hostColor = 'Red'
} else {
  $hostColor = 'Green'
}

#Checks if PowerShell is running as Administrator or Root on linux
if ($ROOT) {
  $usrColor = 'Red'
} else {
  $usrColor = 'Green'
}

function prompt {
  if ("$(Get-Location)" -eq "$HOME") {
    $location = "~"
  } else {
    $location = $(Get-Location)
  }
  Write-Host ("PS ") -NoNewLine -ForegroundColor $osColor
  Write-Host ([Environment]::UserName) -NoNewLine -ForegroundColor $usrColor
  Write-Host ("@") -NoNewLine -ForegroundColor $txtColor
  Write-Host ([system.environment]::MachineName) -NoNewLine -ForegroundColor $hostColor
  Write-Host (" [") -NoNewLine -ForegroundColor $txtColor
  Write-Host ($location) -NoNewLine -ForegroundColor 'cyan'
  Write-Host ("]") -NoNewLine -ForegroundColor $txtColor
  Write-Host (" ->") -NoNewLine -ForegroundColor 'white'
  return " "
}
