control update

if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

winget source update
winget upgrade --all

#Write-Host "Press any key to continue..."
#$host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
