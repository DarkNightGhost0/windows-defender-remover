# ️ Remove Security Components (UI & Center)
# ️ 移除安全组件（界面和中心）

This module handles the removal of the visual and system integration aspects of Windows Security.
此模块负责移除 Windows 安全的视觉和系统集成方面。

##  What gets removed?
##  会移除什么？

* **Windows Security App:** The UWP application (SecHealthUI) found in the Start Menu.
* **Windows 安全应用：** 开始菜单中的 UWP 应用程序 (SecHealthUI)。

* **Windows Security Center Service (wscsvc):** The service that monitors security status.
* **Windows 安全中心服务 (wscsvc)：** 监控安全状态的服务。

* **Settings Page:** Removes the "Windows Security" section from the Windows Settings app.
* **设置页面：** 从 Windows 设置应用中移除"Windows 安全"部分。

* **System Tray Icon:** The shield icon in the taskbar.
* **系统托盘图标：** 任务栏中的盾牌图标。

##  Manual Removal via PowerShell
##  通过 PowerShell 手动移除

If you wish to remove the Security App without using the full removal suite, you can run the following PowerShell code, save into ps1, and run with PowerRun.
如果您希望在不使用完整移除套件的情况下移除安全应用，您可以运行以下 PowerShell 代码，保存为 ps1 文件，并使用 PowerRun 运行。

```powershell
# 定义要移除的应用列表，这里包含 SecHealthUI（Windows 安全中心应用）
$remove_appx = @("SecHealthUI"); 

# 获取在线的预配置应用包信息
$provisioned = get-appxprovisionedpackage -online; 

# 获取所有用户的已安装应用包信息
$appxpackage = get-appxpackage -allusers; 

# 初始化生命周期结束（EOL）应用列表
$eol = @()

# 定义注册表路径：存储所有用户的应用商店信息
$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore'

# 初始化用户 SID 列表，包含系统账户 (S-1-5-18)
$users = @('S-1-5-18'); 

# 如果注册表路径存在，则添加所有用户特定的 SID（S-1-5-21 开头的为用户 SID）
if (test-path $store) {$users += $((dir $store -ea 0 |where {$_ -like '*S-1-5-21*'}).PSChildName)}

# 遍历每个要移除的应用
foreach ($choice in $remove_appx) { 
    # 如果应用名为空则跳过
    if ('' -eq $choice.Trim()) {continue}
    
    # 处理预配置的应用包（新安装系统时会自动安装的应用）
    foreach ($appx in $($provisioned |where {$_.PackageName -like "*$choice*"})) {
        # 初始化跳过标志
        $next = !1; 
        
        # 检查是否在跳过列表中（当前 skip 变量未定义，此逻辑预留）
        foreach ($no in $skip) {if ($appx.PackageName -like "*$no*") {$next = !0}} ; 
        if ($next) {continue}
        
        # 获取完整的包名
        $PackageName = $appx.PackageName; 
        
        # 获取包家族名称（用于标识应用的唯一标识符）
        $PackageFamilyName = ($appxpackage |where {$_.Name -eq $appx.DisplayName}).PackageFamilyName 
        
        # 在注册表中创建"已取消配置"标记，防止应用重新安装
        ni "$store\Deprovisioned\$PackageFamilyName" -force >''; 
        
        # 输出包家族名称
        $PackageFamilyName  
        
        # 为每个用户 SID 创建"生命周期结束"标记，表示该应用已被永久移除
        foreach ($sid in $users) {ni "$store\EndOfLife\$sid\$PackageName" -force >''} ; 
        
        # 将包名添加到 EOL 列表
        $eol += $PackageName
        
        # 使用 DISM 工具将应用设置为可移除状态（解除不可移除保护）
        dism /online /set-nonremovableapppolicy /packagefamily:$PackageFamilyName /nonremovable:0 >''
        
        # 从系统中移除预配置的应用包（影响所有用户）
        remove-appxprovisionedpackage -packagename $PackageName -online -allusers >''
    }
    
    # 处理已安装的应用包
    foreach ($appx in $($appxpackage |where {$_.PackageFullName -like "*$choice*"})) {
        # 初始化跳过标志
        $next = !1; 
        
        # 检查是否在跳过列表中
        foreach ($no in $skip) {if ($appx.PackageFullName -like "*$no*") {$next = !0}} ; 
        if ($next) {continue}
        
        # 获取完整的包全名
        $PackageFullName = $appx.PackageFullName; 
        
        # 在注册表中创建"已取消配置"标记
        ni "$store\Deprovisioned\$appx.PackageFamilyName" -force >''; 
        
        # 输出包全名
        $PackageFullName
        
        # 为每个用户 SID 创建"生命周期结束"标记
        foreach ($sid in $users) {ni "$store\EndOfLife\$sid\$PackageFullName" -force >''} ; 
        
        # 将包全名添加到 EOL 列表
        $eol += $PackageFullName
        
        # 使用 DISM 工具将应用设置为可移除状态
        dism /online /set-nonremovableapppolicy /packagefamily:$PackageFamilyName /nonremovable:0 >''
        
        # 从所有用户账户中移除该应用包
        remove-appxpackage -package $PackageFullName -allusers >''
    }
}
```

Attention! This .ps1 file must be runned with PowerRun.   
注意！此 .ps1 文件必须使用 PowerRun 运行。   
  

The command argument is
命令参数是


```cmd
# 使用 PowerRun 以提升的权限运行 PowerShell 脚本，绕过执行策略
Powerrun powershell.exe -noprofile -executionpolicy bypass -file "RemoveSecHealthApp.ps1"