@echo off
Title HDD to VDI v0.1 - By Leproide
Color B

if exist "disk2vhd.exe"  (
goto main
) else (
    Color C
	cls
	echo.
	Echo !ERROR!
	Echo disk2vhd required!
	timeout /t 5 > nul
	start https://download.sysinternals.com/files/Disk2vhd.zip
	Exit
)

:main

cls
Echo.
:::  __  __     _____     _____        ______   ______        __   __   _____     __    
::: /\ \_\ \   /\  __-.  /\  __-.     /\__  _\ /\  __ \      /\ \ / /  /\  __-.  /\ \   
::: \ \  __ \  \ \ \/\ \ \ \ \/\ \    \/_/\ \/ \ \ \/\ \     \ \ \'/   \ \ \/\ \ \ \ \  
:::  \ \_\ \_\  \ \____-  \ \____-       \ \_\  \ \_____\     \ \__|    \ \____-  \ \_\ 
:::   \/_/\/_/   \/____/   \/____/        \/_/   \/_____/      \/_/      \/____/   \/_/ 
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
Echo.
Echo.
Echo Starting the VHDX creation wizard...
Echo Please, select the system HDD to clone in the GUI.
Echo Waiting...
disk2vhd.exe > nul
cls
Echo.
Echo Checking if VBoxManage exist...
if exist "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"  (
    goto Continua
) else (
    Color C
	cls
	echo.
	Echo !ERROR!
	Echo Install VirtualBox to continue...
	timeout /t 5 > nul
	start https://www.virtualbox.org/wiki/Downloads
	Exit
)
:Continua
cls
Echo.
Echo VHDX/VHD to VDI conversion...
Echo.
set /p vhdx=VHD/VHDX path (drag and drop allowed): 
set /p vdi=Generated VDI path (drag and drop allowed): 
cls
echo.
echo Converting "%vhdx%" to "%vdi%"
echo.
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" clonemedium disk %vhdx% %vdi% --format VDI
echo.
Echo Done! check the VBoxManage output.
Echo Please use the generated VDI for creating VBOX VM
Echo.
Echo Press key to exit...
pause > nul
Exit
