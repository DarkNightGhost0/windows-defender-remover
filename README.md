# ❌️ Defender Remover / Defender Disabler
# ❌️ Defender 移除器 / Defender 禁用器

<a href="https://github.com/ionuttbara/windows-defender-remover">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./site-res/darkmode.png">
        <img alt="Defender Remover" src="./site-res/lightmode.png">
    </picture>
</a>

##  Project Modules
## 项目模块

For specific details on the sub-components, please check:
有关子组件的详细信息，请查看：

* **[💿 ISO Maker](./ISO_Maker/README.md)** - Create a custom Windows ISO with Defender disabled.
* **[💿 ISO 制作器](./ISO_Maker/README.md)** - 创建禁用 Defender 的自定义 Windows ISO。

* **[🛡️ Remove Defender Engine](./Remove_Defender/README.md)** - Remove the antivirus core and services.
* **[🛡️ 移除 Defender 引擎](./Remove_Defender/README.md)** - 移除防病毒核心和服务。

* **[🖥️ Remove Security App](./Remove_SecurityComp/README.md)** - Remove the Windows Security UI.
* **[🖥️ 移除安全应用](./Remove_SecurityComp/README.md)** - 移除 Windows 安全界面。

---

## ❓️ What does the app do?
## ❓️ 这个应用程序做什么？

This application removes / disables Windows Defender, including the Windows Security App, Windows Virtualization-Based Security (VBS), Windows SmartScreen, Windows Security Services, Windows Web-Threat Service, Windows File Virtualization (UAC), Microsoft Defender App Guard, Microsoft Driver Block List, System Mitigations and the Windows Defender page in the Settings App on Windows 10 or later.
此应用程序移除/禁用 Windows Defender，包括 Windows 安全应用、Windows 基于虚拟化的安全 (VBS)、Windows SmartScreen、Windows 安全服务、Windows 网络威胁服务、Windows 文件虚拟化 (UAC)、Microsoft Defender 应用保护、Microsoft 驱动程序阻止列表、系统缓解措施以及 Windows 10 或更高版本设置应用中的 Windows Defender 页面。


## ❓️ What components are removing?
## ❓️ 正在移除哪些组件？

### Removing Security Components
### 移除安全组件

    This script removes/disables following security components:
    此脚本移除/禁用以下安全组件：

        - support for Windows Security Center including Windows Security Center Service (wscsvc), Windows Security Service (SgrmBroker, Sgrm Drivers) which are needed to run Windows Security App.
        - 对 Windows 安全中心的支持，包括运行 Windows 安全应用所需的 Windows 安全中心服务 (wscsvc)、Windows 安全服务 (SgrmBroker, Sgrm 驱动程序)。

        - virtualization support.
        - 虚拟化支持。

            - Hypervisor startup (this fixes disablation of Virtualization Based Security, this will auto enable if you use Hyper-V and/or WSL (Windows Subsystem for Linux), WSA (Windows Subsystem for Android))
            - 管理程序启动（这修复了基于虚拟化的安全禁用问题，如果您使用 Hyper-V 和/或 WSL（Windows Subsystem for Linux）、WSA（Windows Subsystem for Android），它将自动启用）

            - LUA (disables File Virtualization and User Account Control, which will run all apps as administrator priviliges (also fixes old app errors))
            - LUA（禁用文件虚拟化和用户帐户控制，将以管理员权限运行所有应用程序（也修复旧应用程序错误））

            - Exploit Guard (something about Exploits)
            - Exploit Guard（与漏洞利用相关）

            - Windows Smart Control
            - Windows 智能控制

            - Tamper Protection (for Windows 11 21H2 or earlier)
            - 篡改保护（适用于 Windows 11 21H2 或更早版本）

        - SecHealthUI (Windows Security UWP App)
        - SecHealthUI（Windows 安全 UWP 应用）

        - SmartScreen
        - SmartScreen

        - Pluton Support and Pluton Services Support
        - Pluton 支持和 Pluton 服务支持

        - System Mitigations
        - 系统缓解措施

          - "Services Mitigations" (search on admx.help for more informations, its policy)
          - "服务缓解措施"（在 admx.help 上搜索以获取更多信息，这是策略）

          - Spectre and Meltdown Mitigation (for get +30% performance on old Intel CPUs)
          - Spectre 和 Meltdown 缓解措施（在旧款 Intel CPU 上获得 +30% 性能）

        - Windows Security Section from Settings App.
        - 设置应用中的 Windows 安全部分。

### Removing Antivirus Components
### 移除防病毒组件

    This script forcily removes following antivirus components:
    此脚本强制移除以下防病毒组件：

      - Windows Defender Definition Update List (this will disable updating definitions of Defender because its removed)
      - Windows Defender 定义更新列表（这将禁用 Defender 的定义更新，因为它已被移除）

      - Windows Defender SpyNet Telemetry
      - Windows Defender SpyNet 遥测

      - Antivirus Service
      - 防病毒服务

      - Windows Defender Antivirus filter and windows defender rootkit scanner drivers
      - Windows Defender 防病毒过滤器和 Windows Defender Rootkit 扫描器驱动程序

      - Antivirus Scanning Tasks
      - 防病毒扫描任务

      - Shell Associations (Context Menu)
      - Shell 关联（上下文菜单）

      - Hides Antivirus Protection section from Windows Security App.
      - 从 Windows 安全应用中隐藏防病毒保护部分。

## 📃 Instructions
## 📃 使用说明

> [!NOTE]
> A system restore point is recommended before you run the script. (if you don't know what are you doing)
> 在运行脚本之前建议创建系统还原点。（如果您不知道自己在做什么）

1. Download the packed script from [Releases](https://github.com/ionuttbara/windows-defender-remover/releases)
1. 从 [Releases](https://github.com/ionuttbara/windows-defender-remover/releases) 下载打包的脚本

2. Run the ".exe" as administrator
2. 以管理员身份运行 ".exe"

3. Follow the instructions displayed
3. 按照显示的说明操作

OR
或

you can use git
您可以使用 git

```
git clone [https://github.com/ionuttbara/windows-defender-remover.git](https://github.com/ionuttbara/windows-defender-remover.git)
cd windows-defender-remover
Script_Run.bat
```


OR
或

you can use download entire source code
您可以下载整个源代码

1. Download the source code from [Releases](https://github.com/jbara2002/windows-defender-remover/releases).
1. 从 [Releases](https://github.com/jbara2002/windows-defender-remover/releases) 下载源代码。

2. Choose the file **Source Code(.zip)** from last version and download it.
2. 选择最新版本的 **源代码(.zip)** 文件并下载。

3. Unarchive the file into a folder and run the Script_Run.bat.
3. 将文件解压缩到文件夹中并运行 Script_Run.bat。

![cli](https://github.com/drunkwinter/windows-defender-remover/assets/38593134/46007191-0a65-43c2-b451-a993ff90e00e)

You can file an [issue](https://github.com/ionuttbara/windows-defender-remover/issues) if you experience any problems.
如果遇到任何问题，您可以提交 [issue](https://github.com/ionuttbara/windows-defender-remover/issues)。

## 📃 Automation of the script
## 📃 脚本自动化

You can remove Defender with arguments.
您可以使用参数移除 Defender。

#### Removing
#### 移除

```PowerShell
# Removal
# 移除
Defender.Remover.exe /r <# or /R #>
```


## Disable or Remove Windows Defender *Application Guard Policies* (advanced)
## 禁用或移除 Windows Defender *应用程序保护策略*（高级）

If you have any problems when opening an app (*extremely rare*) and get the message "The app can not run because Device Guard" or "Windows Defender Application Guard Blocked this app", you have to remove 4 files with the same name, from different locations.
如果在打开应用程序时遇到任何问题（*极其罕见*）并收到消息"由于设备保护，应用程序无法运行"或"Windows Defender 应用程序保护阻止了此应用程序"，您必须从不同位置移除 4 个同名文件。


- In EFI Partition
- 在 EFI 分区中

```PowerShell
Remove-Item -LiteralPath "$((Get-Partition | ? IsSystem).AccessPaths[0])Microsoft\Boot\WiSiPolicy.p7b"
```

- In Code Integrity Folder
- 在代码完整性文件夹中

```PowerShell
Remove-Item -LiteralPath "$env:windir\System32\CodeIntegrity\WiSiPolicy.p7b"
```

- In Windows Folder
- 在 Windows 文件夹中

```PowerShell
Remove-Item -LiteralPath "$env:windir\Boot\EFI\wisipolicy.p7b"
```

- In WinSxS Folder
- 在 WinSxS 文件夹中

```PowerShell
Remove-Item -Path "$env:windir\WinSxS" -Include *winsipolicy.p7b* -Recurse
```

## Creating an ISO with Windows Defender and Services disabled
## 创建禁用 Windows Defender 和服务的 ISO

You can create an ISO with Windoows Defender and Security Services Disabled. It's easy, so this is a fiie which it can helps you.
您可以创建禁用 Windows Defender 和安全服务的 ISO。这很简单，所以这是一个可以帮助您的文件。

Here are the rules:
以下是步骤：

1. Mount the ISO and extract it into location.
1. 挂载 ISO 并将其提取到指定位置。

2. Open the **sources** folder and create the **$OEM$** folder. (this is needed to run the DefenderRemover part in OOBE).
2. 打开 **sources** 文件夹并创建 **$OEM$** 文件夹。（这是在 OOBE 中运行 DefenderRemover 部分所必需的）。

3. Open the **$OEM$** folder and create the folder with **$$** name.
3. 打开 **$OEM$** 文件夹并创建名为 **$$** 的文件夹。

4. Open the **$$** folder and create the folder with **Panther** name.
4. 打开 **$$** 文件夹并创建名为 **Panther** 的文件夹。

5. Open the **Panther** folder.
5. 打开 **Panther** 文件夹。

   The path it shown like to
   路径显示如下

    **%location of extracted ISO%\sources\$OEM$\$$\Panther\**
    **%提取的 ISO 位置%\sources\$OEM$\$$\Panther\**

6. Download the unnatended.xml file from repo in ISO_Maker folder and put it in Panther folder.
6. 从 ISO_Maker 文件夹中的仓库下载 unattend.xml 文件并将其放入 Panther 文件夹。

7. Save this as bootable ISO. (for now the script can't do this automaticly, but it will do in next version).
7. 将其保存为可引导 ISO。（目前脚本无法自动执行此操作，但将在下一个版本中实现）。
    

## ❓ Frequently Asked Questions
## ❓ 常见问题解答

#### ⭕ How to remove Windows Security Center / Windows SecurityApp from PC without downloading Script?
#### ⭕ 如何在不下载脚本的情况下从电脑中移除 Windows 安全中心 / Windows 安全应用？

Paste this code into a powershell file and after **Run as Administrator**.
将此代码粘贴到 PowerShell 文件中，然后**以管理员身份运行**。

```
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

#### ⭕ Why is the downloaded executable being flagged as a virus?
#### ⭕ 为什么下载的可执行文件被标记为病毒？

That is a false positive.
那是误报。

Some security apps flag this app as a virus because of the way the ".exe" files are created. Download with **git** or source code .zip will indicate virus-free.
某些安全应用程序由于 ".exe" 文件的创建方式而将此应用程序标记为病毒。使用 **git** 或源代码 .zip 下载将表明无病毒。

Starting with Defender 12.6.x , some versions are considered as virus, some are not (its a bug from me, so do not file for this).
从 Defender 12.6.x 开始，某些版本被视为病毒，有些则不是（这是我的一个 bug，所以不要为此提交问题）。

#### ⭕ Why is the patch not working when Windows is updated?
#### ⭕ 为什么 Windows 更新后补丁不起作用？

Windows Update includes a ```Intelligence Update``` which blocks certain actions and modifies Windows Defender/Security policies.
Windows 更新包含一个 ```智能更新```，它会阻止某些操作并修改 Windows Defender/安全策略。

If the script is not working for you, check if you have the Windows Security Intelligence Update installed. If you do, disable tamper protection, and re-run the script.
如果脚本对您不起作用，请检查是否安装了 Windows 安全智能更新。如果已安装，请禁用篡改保护，然后重新运行脚本。

#### ⭕ How to use the package remover without downloading the executable from the release?
#### ⭕ 如何在不从发布版下载可执行文件的情况下使用包移除器？

Run the desired ".bat" file from cmd with PowerRun (by dragging to the executable). You must reboot for the changes to take effect.
使用 PowerRun 从 cmd 运行所需的 ".bat" 文件（通过拖放到可执行文件）。您必须重新启动才能使更改生效。

#### ⭕ How to disable VBS if the removal script does not work
#### ⭕ 如果移除脚本不起作用，如何禁用 VBS

Disable with this command and reboot.
使用此命令禁用并重新启动。

```
bcdedit /set hypervisorlaunchtype off
```

After that you will not be able to use virtual machines.  
之后您将无法使用虚拟机。  

#### ⭕  Why  VBS is keeping enabling on Windows 11?
#### ⭕  为什么 VBS 在 Windows 11 上保持启用状态？

By default the script is disabling VBS to gain performance in your system. The factors which is keeping VBS enabled is Windows Virtualization.  
默认情况下，脚本会禁用 VBS 以提高系统性能。保持 VBS 启用的因素是 Windows 虚拟化。  
    
Apps and features which is used by Windows Virtualization:  
Windows 虚拟化使用的应用程序和功能：  

- Windows Subsystem for **Android**/**Linux** - HyperV Virtual Machine
- Windows Subsystem for **Android**/**Linux** - HyperV 虚拟机

- <a href="https://apps.microsoft.com/detail/9n0tn65p5bf6?hl=en-US&gl=US" target="_blank">Microsoft Emulator</a>  (Windows 10X Emulator which you can find in Microsoft Store)
- <a href="https://apps.microsoft.com/detail/9n0tn65p5bf6?hl=en-US&gl=US" target="_blank">Microsoft 模拟器</a>  （您可以在 Microsoft Store 中找到的 Windows 10X 模拟器）

- Android Studio integration in VisuaL Studio  or another Emulators (for Windows 10 22H2 with March 2025 Update or newer)
- Visual Studio 中的 Android Studio 集成或其他模拟器（适用于带有 2025 年 3 月更新或更高版本的 Windows 10 22H2）

If you open those one of that app mentioned earlier, VBS will be enabled without user intervention. Its needed to run Virtual Machine engine. If you don't use any virtual machine, you can file an Issue at <a href="https://github.com/ionuttbara/windows-defender-remover/issues" target="_blank">here</a>.
如果您打开前面提到的任何一个应用程序，VBS 将在没有用户干预的情况下启用。运行虚拟机引擎需要它。如果您不使用任何虚拟机，您可以在<a href="https://github.com/ionuttbara/windows-defender-remover/issues" target="_blank">这里</a>提交 Issue。
