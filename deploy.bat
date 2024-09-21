@echo off

set "software=X-Plane 12"
set "reg=C:\Windows\System32\reg.exe"
set "findstr=C:\Windows\System32\findstr.exe"

for /f "tokens=2*" %%i in ('%reg% query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%software%" ^| %findstr% "InstallLocation"') do (
  set "xplane12_install_location=%%j"
)

set "scripts_directory=%xplane12_install_location%\Resources\plugins\FlyWithLua\Scripts\"
set "source_files=*.lua"

copy "%source_files%" "%scripts_directory%"

for /r "%scripts_directory%" %%f in (*.lua) do (
  echo %%f
)
