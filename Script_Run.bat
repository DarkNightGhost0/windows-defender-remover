@set defenderremoverver=13.0
@setlocal DisableDelayedExpansion
@echo off

:: 检查当前是否具有管理员权限
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在请求管理员权限...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
pushd "%CD%"
CD /D "%~dp0"



:: 参数处理部分 - 支持命令行直接指定操作
IF "%1"== "y" GOTO :removedef
IF "%1"== "Y" GOTO :removedef
IF "%1"== "a" GOTO :removeantivirus
IF "%1"== "A" GOTO :removeantivirus
:--------------------------------------


:--------------------------------------
cls
echo ------ Defender 移除脚本，版本 %defenderremoverver% ------
echo 请选择一个选项：
echo.
echo 是否要移除 Windows Defender 及其相关组件？执行后需要重启系统。
echo 建议先创建备份和/或系统还原点。
echo [Y] 移除 Windows Defender 防病毒 + Windows 安全应用
echo [A] 仅移除 Windows Defender 防病毒应用（保留 Windows 安全应用，更新后会恢复）
echo [S] 移除 Defender 文件（需先移除防病毒组件）
choice /C:yas /N
if errorlevel==3 goto removalfiles
if errorlevel==2 goto removeantivirus
if errorlevel==1 goto removedef
:--------------------------------------

:--------------------------------------
:removalfiles
:: 使用 PowerRun 以更高权限运行文件移除脚本
PowerRun cmd.exe /k files_removal.bat
pause
:--------------------------------------




:--------------------------------------
goto :eof
:--------------------------------------

:--------------------------------------
:removedef
CLS

CLS
echo 正在移除 Windows 安全 UWP 应用...

:: 使用 PowerRun 以提升的权限运行 PowerShell 脚本来移除 SecHealthApp
Powerrun powershell.exe -noprofile -executionpolicy bypass -file "RemoveSecHealthApp.ps1"
CLS
echo 正在注销 Windows Defender 安全组件...
:: 遍历 Remove_defender 文件夹中的所有注册表文件并导入（使用 PowerRun 提升权限）
FOR /R %%f IN (Remove_defender\*.reg) DO PowerRun.exe regedit.exe /s "%%f"
:: 再次遍历导入注册表文件（标准权限）
FOR /R %%f IN (Remove_defender\*.reg) DO regedit.exe /s "%%f"
:: 遍历 Remove_SecurityComp 文件夹中的注册表文件并导入（使用 PowerRun 提升权限）
FOR /R %%f IN (Remove_SecurityComp\*.reg) DO PowerRun.exe regedit.exe /s "%%f"
timeout 3
:: 10秒后强制重启系统
shutdown /r /f /t 10
exit
:--------------------------------------


:--------------------------------------
:removeantivirus
CLS
echo 正在移除 Windows 安全 UWP 应用...
:: 遍历 Remove_defender 文件夹中的所有注册表文件并导入（使用 PowerRun 提升权限）
FOR /R %%f IN (Remove_defender\*.reg) DO PowerRun.exe regedit.exe /s "%%f"
:: 再次遍历导入注册表文件（标准权限）
FOR /R %%f IN (Remove_defender\*.reg) DO regedit.exe /s "%%f"
CLS
timeout 3
:: 10秒后强制重启系统
shutdown /r /f /t 10
exit
:--------------------------------------
