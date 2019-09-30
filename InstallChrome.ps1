Get-Url http://dl.google.com/chrome/install/375.126/chrome_installer.exe c:\temp\chrome_installer.exe
Start-Process -FilePath 'c:\temp\chrome_installer.exe' -ArgumentList '/silent', '/install' -Wait
#Start-Process -FilePath 'C:\temp\DifferentProgram.exe' -ArgumentList '/argument' -Wait
