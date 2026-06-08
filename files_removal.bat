@echo off
:: 显示等待提示信息
Echo Please wait...
Echo 请稍候...

:: 获取 Windows Defender 数据文件夹的所有权（递归操作，自动确认）
takeown /f "C:\ProgramData\Microsoft\Windows Defender" /r /d y
:: 授予管理员对 Windows Defender 数据文件夹的完全控制权限（递归应用）
icacls "C:\ProgramData\Microsoft\Windows Defender" /grant administrators:F /t
:: 强制删除 Windows Defender 数据文件夹及其所有内容
rd /s /q "C:\ProgramData\Microsoft\Windows Defender"

:: 获取 Program Files 中 Windows Defender 文件夹的所有权（递归操作，自动确认）
takeown /f "C:\Program Files\Windows Defender" /r /d y
:: 授予管理员对 Program Files 中 Windows Defender 文件夹的完全控制权限（递归应用）
icacls "C:\Program Files\Windows Defender" /grant administrators:F /t
:: 强制删除 Program Files 中的 Windows Defender 文件夹及其所有内容
rd /s /q "C:\Program Files\Windows Defender"

:: 获取 Program Files (x86) 中 Windows Defender 文件夹的所有权（递归操作，自动确认）
takeown /f "C:\Program Files (x86)\Windows Defender" /r /d y
:: 授予管理员对 Program Files (x86) 中 Windows Defender 文件夹的完全控制权限（递归应用）
icacls "C:\Program Files (x86)\Windows Defender" /grant administrators:F /t
:: 强制删除 Program Files (x86) 中的 Windows Defender 文件夹及其所有内容
rd /s /q "C:\Program Files (x86)\Windows Defender"

:: 获取 Windows Defender 高级威胁保护文件夹的所有权（递归操作，自动确认）
takeown /f "C:\Program Files\Windows Defender Advanced Threat Protection" /r /d y
:: 授予管理员对 Windows Defender 高级威胁保护文件夹的完全控制权限（递归应用）
icacls "C:\Program Files\Windows Defender Advanced Threat Protection" /grant administrators:F /t
:: 强制删除 Windows Defender 高级威胁保护文件夹及其所有内容
rd /s /q "C:\Program Files\Windows Defender Advanced Threat Protection"

:: 退出脚本
exit