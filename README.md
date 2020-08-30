# PowerShell-profile

To install on windows 10 you need powershell v7 to upgrade start a powershell as Administrator:
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"

On powershell v7 run as Administrator, Then run these commands:
git clone https://github.com/zack1119/PowerShell-profile
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Bypass -Force
cd $Home/PowerShell-profile
./Win-Install.ps1
