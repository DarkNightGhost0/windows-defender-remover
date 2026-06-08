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