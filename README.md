# ❌️ Defender 移除器 / Defender 禁用器
<sup>*Defender Remover / Defender Disabler*</sup>

<a href="https://github.com/ionuttbara/windows-defender-remover">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./site-res/darkmode.png">
        <img alt="Defender Remover" src="./site-res/lightmode.png">
    </picture>
</a>

## 📦 项目模块
<sup>*Project Modules*</sup>

有关子组件的详细信息，请查看：
<sup>*For specific details on the sub-components, please check:*</sup>

* **[💿 ISO 制作器](./ISO_Maker/README.md)** - 创建禁用 Defender 的自定义 Windows ISO。
  <br><sup>*Create a custom Windows ISO with Defender disabled.*</sup>

* **[🛡️ 移除 Defender 引擎](./Remove_Defender/README.md)** - 移除防病毒核心和服务。
  <br><sup>*Remove the antivirus core and services.*</sup>

* **[🖥️ 移除安全应用](./Remove_SecurityComp/README.md)** - 移除 Windows 安全界面。
  <br><sup>*Remove the Windows Security UI.*</sup>

---

## ❓ 这个应用程序做什么？
<sup>*What does the app do?*</sup>

此应用程序移除/禁用 Windows Defender，包括 Windows 安全应用、Windows 基于虚拟化的安全 (VBS)、Windows SmartScreen、Windows 安全服务、Windows 网络威胁服务、Windows 文件虚拟化 (UAC)、Microsoft Defender 应用保护、Microsoft 驱动程序阻止列表、系统缓解措施以及 Windows 10 或更高版本设置应用中的 Windows Defender 页面。

<sup>*This application removes/disables Windows Defender, including the Windows Security App, Windows Virtualization-Based Security (VBS), Windows SmartScreen, Windows Security Services, Windows Web-Threat Service, Windows File Virtualization (UAC), Microsoft Defender App Guard, Microsoft Driver Block List, System Mitigations and the Windows Defender page in the Settings App on Windows 10 or later.*</sup>

## ❓ 正在移除哪些组件？
<sup>*What components are removing?*</sup>

### 🛡️ 移除安全组件
<sup>*Removing Security Components*</sup>

此脚本移除/禁用以下安全组件：
<sup>*This script removes/disables following security components:*</sup>

- **Windows 安全中心支持** - 包括运行 Windows 安全应用所需的 Windows 安全中心服务 (wscsvc)、Windows 安全服务 (SgrmBroker, Sgrm 驱动程序)
  <br><sup>*Support for Windows Security Center including Windows Security Center Service (wscsvc), Windows Security Service (SgrmBroker, Sgrm Drivers)*</sup>

- **虚拟化支持**
  <br><sup>*Virtualization support*</sup>
  - 管理程序启动（修复基于虚拟化的安全禁用问题，使用 Hyper-V/WSL/WSA 时自动启用）
    <br><sup>*Hypervisor startup (fixes VBS disablation, auto enables with Hyper-V/WSL/WSA)*</sup>
  - LUA（禁用文件虚拟化和用户帐户控制，以管理员权限运行所有应用）
    <br><sup>*LUA (disables File Virtualization and UAC, runs apps as administrator)*</sup>
  - Exploit Guard（漏洞利用防护）
    <br><sup>*Exploit Guard*</sup>
  - Windows 智能控制
    <br><sup>*Windows Smart Control*</sup>
  - 篡改保护（适用于 Windows 11 21H2 或更早版本）
    <br><sup>*Tamper Protection (for Windows 11 21H2 or earlier)*</sup>

- **SecHealthUI** - Windows 安全 UWP 应用
  <br><sup>*SecHealthUI (Windows Security UWP App)*</sup>

- **SmartScreen** - 智能屏幕过滤器
  <br><sup>*SmartScreen*</sup>

- **Pluton 支持** - Pluton 安全处理器和服务支持
  <br><sup>*Pluton Support and Pluton Services Support*</sup>

- **系统缓解措施**
  <br><sup>*System Mitigations*</sup>
  - 服务缓解措施（详见 admx.help 策略文档）
    <br><sup>*"Services Mitigations" (see admx.help for policy details)*</sup>
  - Spectre 和 Meltdown 缓解措施（旧款 Intel CPU 可提升 +30% 性能）
    <br><sup>*Spectre and Meltdown Mitigation (+30% performance on old Intel CPUs)*</sup>

- **设置应用中的 Windows 安全部分**
  <br><sup>*Windows Security Section from Settings App*</sup>

### 🦠 移除防病毒组件
<sup>*Removing Antivirus Components*</sup>

此脚本强制移除以下防病毒组件：
<sup>*This script forcibly removes following antivirus components:*</sup>

- **Windows Defender 定义更新列表** - 禁用 Defender 的定义更新
  <br><sup>*Windows Defender Definition Update List (disables definition updates)*</sup>

- **Windows Defender SpyNet 遥测** - 停止向 Microsoft 发送数据
  <br><sup>*Windows Defender SpyNet Telemetry*</sup>

- **防病毒服务** - 核心防病毒服务
  <br><sup>*Antivirus Service*</sup>

- **Windows Defender 驱动程序** - 防病毒过滤器和 Rootkit 扫描器驱动
  <br><sup>*Windows Defender Antivirus filter and rootkit scanner drivers*</sup>

- **防病毒扫描任务** - 自动扫描和维护任务
  <br><sup>*Antivirus Scanning Tasks*</sup>

- **Shell 关联** - 右键上下文菜单
  <br><sup>*Shell Associations (Context Menu)*</sup>

- **隐藏防病毒保护部分** - 从 Windows 安全应用中隐藏
  <br><sup>*Hides Antivirus Protection section from Windows Security App*</sup>

## 📃 使用说明
<sup>*Instructions*</sup>

> [!NOTE]
> **建议：** 在运行脚本之前创建系统还原点（如果您不确定自己在做什么）
> <sup>*A system restore point is recommended before you run the script (if you don't know what you are doing)*</sup>

### 方法一：下载打包脚本

1. 从 [Releases](https://github.com/ionuttbara/windows-defender-remover/releases) 下载打包的脚本
   <br><sup>*Download the packed script from Releases*</sup>

2. 以管理员身份运行 ".exe" 文件
   <br><sup>*Run the ".exe" as administrator*</sup>

3. 按照显示的说明操作
   <br><sup>*Follow the instructions displayed*</sup>

### 方法二：使用 Git

```bash
git clone https://github.com/ionuttbara/windows-defender-remover.git
cd windows-defender-remover
Script_Run.bat
```

### 方法三：下载源代码

1. 从 [Releases](https://github.com/jbara2002/windows-defender-remover/releases) 下载源代码
   <br><sup>*Download the source code from Releases*</sup>

2. 选择最新版本的 **源代码(.zip)** 文件并下载
   <br><sup>*Choose the file Source Code(.zip) from last version and download it*</sup>

3. 将文件解压缩到文件夹中并运行 Script_Run.bat
   <br><sup>*Unarchive the file into a folder and run the Script_Run.bat*</sup>

![cli](https://github.com/drunkwinter/windows-defender-remover/assets/38593134/46007191-0a65-43c2-b451-a993ff90e00e)

> 💡 如果遇到任何问题，您可以提交 [issue](https://github.com/ionuttbara/windows-defender-remover/issues)
> <sup>*You can file an issue if you experience any problems*</sup>

## ⚙️ 脚本自动化
<sup>*Automation of the script*</sup>

您可以使用参数自动移除 Defender：
<sup>*You can remove Defender with arguments:*</sup>

```PowerShell
# 移除命令
# Removal
Defender.Remover.exe /r
```

## 🔧 高级：禁用应用程序保护策略
<sup>*Disable or Remove Windows Defender Application Guard Policies (advanced)*</sup>

如果在打开应用程序时遇到"由于设备保护，应用程序无法运行"或"Windows Defender 应用程序保护阻止了此应用程序"的错误（极其罕见），需要从不同位置移除 4 个同名文件：

<sup>*If you have problems opening an app and get "Device Guard" or "Application Guard Blocked" message (extremely rare), remove 4 files with the same name from different locations:*</sup>

### 1. EFI 分区中
<sup>*In EFI Partition*</sup>

```PowerShell
Remove-Item -LiteralPath "$((Get-Partition | ? IsSystem).AccessPaths[0])Microsoft\Boot\WiSiPolicy.p7b"
```

### 2. 代码完整性文件夹中
<sup>*In Code Integrity Folder*</sup>

```PowerShell
Remove-Item -LiteralPath "$env:windir\System32\CodeIntegrity\WiSiPolicy.p7b"
```

### 3. Windows 文件夹中
<sup>*In Windows Folder*</sup>

```PowerShell
Remove-Item -LiteralPath "$env:windir\Boot\EFI\wisipolicy.p7b"
```

### 4. WinSxS 文件夹中
<sup>*In WinSxS Folder*</sup>

```PowerShell
Remove-Item -Path "$env:windir\WinSxS" -Include *winsipolicy.p7b* -Recurse
```

## 💿 创建禁用 Defender 的 ISO
<sup>*Creating an ISO with Windows Defender and Services disabled*</sup>

您可以创建禁用 Windows Defender 和安全服务的 ISO。步骤如下：

<sup>*You can create an ISO with Windows Defender and Security Services Disabled. Here are the steps:*</sup>

1. 挂载 ISO 并将其提取到指定位置
   <br><sup>*Mount the ISO and extract it into location*</sup>

2. 打开 **sources** 文件夹并创建 **$OEM$** 文件夹（OOBE 中运行 DefenderRemover 所需）
   <br><sup>*Open the sources folder and create the $OEM$ folder (needed for OOBE)*</sup>

3. 打开 **$OEM$** 文件夹并创建名为 **$$** 的文件夹
   <br><sup>*Open the $OEM$ folder and create the folder with $$ name*</sup>

4. 打开 **$$** 文件夹并创建名为 **Panther** 的文件夹
   <br><sup>*Open the $$ folder and create the folder with Panther name*</sup>

5. 完整路径示例：
   <br><sup>*The path should look like:*</sup>
   
   ```
   %提取的 ISO 位置%\sources\$OEM$\$$\Panther\
   ```

6. 从 ISO_Maker 文件夹下载 unattend.xml 文件并放入 Panther 文件夹
   <br><sup>*Download the unattend.xml file from ISO_Maker folder and put it in Panther folder*</sup>

7. 将其保存为可引导 ISO（目前需手动操作，未来版本将自动化）
   <br><sup>*Save this as bootable ISO (manual for now, will be automatic in next version)*</sup>

## ❓ 常见问题解答
<sup>*Frequently Asked Questions*</sup>

### ⭕ 如何在不下载脚本的情况下移除 Windows 安全中心？
<sup>*How to remove Windows Security Center without downloading Script?*</sup>

将此代码粘贴到 PowerShell 文件中，然后**以管理员身份运行**：

<sup>*Paste this code into a powershell file and Run as Administrator:*</sup>

```PowerShell
$remove_appx = @("SecHealthUI"); $provisioned = get-appxprovisionedpackage -online; $appxpackage = get-appxpackage -allusers; $eol = @()
$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore'
$users = @('S-1-5-18'); if (test-path $store) {$users += $((dir $store -ea 0 |where {$_ -like '*S-1-5-21*'}).PSChildName)}
foreach ($choice in $remove_appx) { if ('' -eq $choice.Trim()) {continue}
  foreach ($appx in $($provisioned |where {$_.PackageName -like "*$choice*"})) {
    $next = !1; foreach ($no in $skip) {if ($appx.PackageName -like "*$no*") {$next = !0}} ; if ($next) {continue}
    $PackageName = $appx.PackageName; $PackageFamilyName = ($appxpackage |where {$_.Name -eq $appx.DisplayName}).PackageFamilyName 
    ni "$store\Deprovisioned\$PackageFamilyName" -force >''; $PackageFamilyName  
    foreach ($sid in $users) {ni "$store\EndOfLife\$sid\$PackageName" -force >''} ; $eol += $PackageName
    dism /online /set-nonremovableapppolicy /packagefamily:$PackageFamilyName /nonremovable:0 >''
    remove-appxprovisionedpackage -packagename $PackageName -online -allusers >''
  }
  foreach ($appx in $($appxpackage |where {$_.PackageFullName -like "*$choice*"})) {
    $next = !1; foreach ($no in $skip) {if ($appx.PackageFullName -like "*$no*") {$next = !0}} ; if ($next) {continue}
    $PackageFullName = $appx.PackageFullName; 
    ni "$store\Deprovisioned\$appx.PackageFamilyName" -force >''; $PackageFullName
    foreach ($sid in $users) {ni "$store\EndOfLife\$sid\$PackageFullName" -force >''} ; $eol += $PackageFullName
    dism /online /set-nonremovableapppolicy /packagefamily:$PackageFamilyName /nonremovable:0 >''
    remove-appxpackage -package $PackageFullName -allusers >''
  }
}
```

### ⭕ 为什么下载的可执行文件被标记为病毒？
<sup>*Why is the downloaded executable being flagged as a virus?*</sup>

那是误报。某些安全应用程序由于 ".exe" 文件的创建方式而将此应用程序标记为病毒。使用 **git** 或源代码 .zip 下载将表明无病毒。

<sup>*That is a false positive. Some security apps flag this app as a virus because of the way ".exe" files are created. Download with git or source code .zip will indicate virus-free.*</sup>

> ⚠️ 从 Defender 12.6.x 开始，某些版本被视为病毒，有些则不是（这是已知问题）
> <sup>*Starting with Defender 12.6.x, some versions are considered as virus, some are not (known issue)*</sup>

### ⭕ 为什么 Windows 更新后补丁不起作用？
<sup>*Why is the patch not working when Windows is updated?*</sup>

Windows 更新包含一个"智能更新"，它会阻止某些操作并修改 Windows Defender/安全策略。如果脚本不起作用，请检查是否安装了 Windows 安全智能更新。如果已安装，请禁用篡改保护，然后重新运行脚本。

<sup>*Windows Update includes an "Intelligence Update" which blocks certain actions and modifies Windows Defender/Security policies. If the script is not working, check if you have the Windows Security Intelligence Update installed. If you do, disable tamper protection, and re-run the script.*</sup>

### ⭕ 如何在不下载可执行文件的情况下使用包移除器？
<sup>*How to use the package remover without downloading the executable?*</sup>

使用 PowerRun 从 cmd 运行所需的 ".bat" 文件（通过拖放到可执行文件）。您必须重新启动才能使更改生效。

<sup>*Run the desired ".bat" file from cmd with PowerRun (by dragging to the executable). You must reboot for the changes to take effect.*</sup>

### ⭕ 如果移除脚本不起作用，如何禁用 VBS？
<sup>*How to disable VBS if the removal script does not work?*</sup>

使用此命令禁用并重新启动：

<sup>*Disable with this command and reboot:*</sup>

```bash
bcdedit /set hypervisorlaunchtype off
```

> ⚠️ 之后您将无法使用虚拟机
> <sup>*After that you will not be able to use virtual machines*</sup>

### ⭕ 为什么 VBS 在 Windows 11 上保持启用状态？
<sup>*Why VBS is keeping enabling on Windows 11?*</sup>

默认情况下，脚本会禁用 VBS 以提高系统性能。保持 VBS 启用的因素是 Windows 虚拟化。

<sup>*By default the script is disabling VBS to gain performance. The factors keeping VBS enabled is Windows Virtualization.*</sup>

**Windows 虚拟化使用的应用程序和功能：**
<sup>*Apps and features used by Windows Virtualization:*</sup>

- Windows Subsystem for **Android**/**Linux** - HyperV 虚拟机
  <br><sup>*Windows Subsystem for Android/Linux - HyperV Virtual Machine*</sup>

- [Microsoft 模拟器](https://apps.microsoft.com/detail/9n0tn65p5bf6?hl=en-US&gl=US)（Windows 10X 模拟器）
  <br><sup>*[Microsoft Emulator](https://apps.microsoft.com/detail/9n0tn65p5bf6?hl=en-US&gl=US) (Windows 10X Emulator)*</sup>

- Visual Studio 中的 Android Studio 集成或其他模拟器（Windows 10 22H2 及更新版本）
  <br><sup>*Android Studio integration in Visual Studio or another Emulators*</sup>

> 💡 如果打开上述任何一个应用程序，VBS 将在没有用户干预的情况下启用（运行虚拟机引擎需要它）。如果您不使用任何虚拟机，可以在[这里](https://github.com/ionuttbara/windows-defender-remover/issues)提交 Issue
> <sup>*If you open those apps, VBS will be enabled without user intervention. Its needed to run Virtual Machine engine. If you don't use any virtual machine, you can file an Issue here.*</sup>

---

## 📝 本项目修改说明

### ✨ 本次优化内容

本项目在原始版本基础上进行了以下改进：

1. **全面的中文注释**
   - 为所有批处理文件（.bat）添加了详细的中文注释
   - 为 PowerShell 脚本（.ps1）添加了中文注释
   - 为所有注册表文件（.reg）添加了详细的中文注释，解释每个键值的作用和影响

2. **文档本地化**
   - 为所有 README.md 文档添加了中英文对照翻译
   - 优化排版，以中文为主导，英文作为辅助参考
   - 在 Remove_Defender/README.md 中添加了所有注册表文件的功能总结

3. **提升可读性**
   - 优化文档结构和排版
   - 使用清晰的标题层级和图标
   - 便于中文用户理解和学习

### 🤖 AI 辅助声明

> **本项目的代码注释和文档优化由 AI 助手（通义灵码/Lingma）生成**
> 
> - 所有中文注释和翻译均由 AI 自动生成
> - 经过人工审核和调整以确保准确性
> - 旨在帮助中文用户更好地理解和使用本工具
> - 欢迎提出改进建议和反馈

### 📚 学习价值

本项目特别适合：
- 🎓 想要学习 Windows 系统管理的中文用户
- 🔍 希望了解注册表操作和系统配置的学习者
- 💻 对 Windows 安全和防御机制感兴趣的技术爱好者
- 🌏 需要中文技术文档的非英语母语用户

---

## ⚠️ 免责声明

> 使用本工具前请仔细阅读说明，建议在测试环境中先行验证。作者不对因使用本工具导致的任何数据丢失或系统问题负责。请在使用前创建系统还原点或备份重要数据。

<sup>*Disclaimer: Please read the instructions carefully before using this tool. Test in a safe environment first. The author is not responsible for any data loss or system issues caused by using this tool. Please create a system restore point or backup important data before use.*</sup>