#️ Remove Core Defender (Engine & Services)
#️ 移除核心 Defender（引擎和服务）

This directory contains registry files and scripts specifically designed to neutralize the backend of Windows Defender.
此目录包含专门用于禁用 Windows Defender 后端的注册表文件和脚本。

## What gets removed?
## 会移除什么？

Running the scripts in this section will forcibly remove or disable:
运行此部分的脚本将强制移除或禁用：

* **Antivirus Service:** The main engine preventing file execution.
* **防病毒服务：** 阻止文件执行的主引擎。

* **Windows Defender Drivers:** Including rootkit scanners and file system filters.
* **Windows Defender 驱动程序：** 包括 Rootkit 扫描器和文件系统过滤器。

* **SmartScreen:** The filter that blocks "unrecognized" apps.
* **SmartScreen：** 阻止"未识别"应用程序的过滤器。

* **SpyNet Telemetry:** Prevents sending data to Microsoft.
* **SpyNet 遥测：** 防止向 Microsoft 发送数据。

* **Scheduled Tasks:** Disables automatic scanning and maintenance tasks.
* **计划任务：** 禁用自动扫描和维护任务。

* **Context Menu:** Removes "Scan with Windows Defender" from the right-click menu.
* **上下文菜单：** 从右键菜单中移除"使用 Windows Defender 扫描"选项。

## Usage
## 使用方法

These files are typically executed automatically by the main `Script_Run.bat`, but can be used individually for troubleshooting or specific needs.
这些文件通常由主脚本 `Script_Run.bat` 自动执行，但也可以单独使用以进行故障排除或满足特定需求。

* **Registry Tweaks (.reg):** Double-click to merge into the registry.
* **注册表调整 (.reg)：** 双击以合并到注册表中。

* **Disabling Mitigation:** Use `Disable Mitigation.reg` to turn off exploit protection features.
* **禁用缓解措施：** 使用 `Disable Mitigation.reg` 关闭漏洞利用保护功能。

> **Note:** Removing these files usually keeps the "Windows Security" app visible, but the antivirus protection inside it will be broken/disabled. If you want to remove the App UI as well, see the [Remove_SecurityComp](../Remove_SecurityComp/README.md) module.
> **注意：** 移除这些文件通常会保持"Windows 安全"应用可见，但其中的防病毒保护将被破坏/禁用。如果您也想移除应用界面，请参阅 [Remove_SecurityComp](../Remove_SecurityComp/README.md) 模块。

---

## 📋 注册表文件功能总结

本目录包含以下注册表文件，每个文件负责禁用 Windows Defender 的特定功能：

### 1. **DisableAntivirusProtection.reg** - 禁用防病毒保护
- 禁用实时监控、行为监控和按需访问保护
- 禁用 IOAV 保护（下载文件扫描）
- 禁用入侵防御系统（IPS）
- 禁用所有本地设置覆盖，防止用户重新启用
- 禁用 Spynet 遥测和样本提交

### 2. **DisableDefenderandSecurityCenterNotifications.reg** - 禁用通知
- 禁用 Windows Defender 安全中心的所有通知
- 隐藏任务栏中的安全中心盾牌图标
- 禁用 toast 弹出通知
- 禁用首次运行向导
- 覆盖防病毒和防火墙状态检查（不发出警告）

### 3. **DisableDefenderPolicies.reg** - 禁用 Defender 策略
- 全面禁用所有防护功能（实时保护、云保护、行为监控等）
- 禁用所有扫描类型（存档、邮件、网络、脚本等）
- 禁用签名更新和云保护
- 禁用受控文件夹访问和网络保护
- 禁用所有报告和通知
- 配置 MpEngine、NIS、Spynet 等组件为禁用状态

### 4. **Disable Mitigation.reg** - 禁用系统缓解措施
- 禁用内核级安全缓解措施（SEHOP 等）
- 禁用 Svchost 服务宿主缓解措施
- 移除 Defender 篡改保护（Tamper Protection）
- 禁用受保护进程轻量级（PPL）
- 禁用易受攻击驱动程序阻止列表
- 可提升旧 CPU 性能（+30%）

### 5. **Disable SmartScreen.reg** - 禁用 SmartScreen
- 禁用 Microsoft Edge 浏览器的 SmartScreen 网络钓鱼保护
- 禁用文件资源管理器和 Windows Shell 的 SmartScreen
- 禁用 Microsoft Store 应用的 Web 内容评估
- 允许从任何位置安装应用程序
- 允许用户覆盖 SmartScreen 警告

### 6. **RemovalofWindowsDefenderAntivirus.reg** - 移除防病毒 COM 组件
- 删除 52 个 Defender 防病毒相关的 CLSID 注册项
- 清理 64 位和 32 位兼容层的所有 COM 组件引用
- 删除 Defender 审计日志和 API 日志记录器
- 彻底破坏 Defender 的核心 COM 组件集成

### 7. **RemoveDefenderTasks.reg** - 移除计划任务
- 删除 4 个 Windows Defender 计划任务缓存项
- 阻止 Defender 的自动化维护和扫描任务执行
- 包括病毒定义更新、实时保护监控、快速扫描等任务

### 8. **RemoveServices.reg** - 移除系统服务
- 删除 WinDefend（主防病毒服务）
- 删除 WdFilter、WdBoot、WdNisDrv/Svc（驱动和网络服务）
- 删除 wscsvc（Windows 安全中心服务）
- 删除 SgrmAgent/Broker（系统.guard 组件）
- 删除 webthreatdefsvc（网络威胁防御服务）
- 删除 Pluton 安全处理器服务
- 删除 MsSecCore/Flt/Wfp（Microsoft 安全组件）

### 9. **RemoveShellAssociation.reg** - 移除 Shell 关联
- 删除 Windows Defender 的 URL 协议关联
- 删除 AppUserModelId 应用标识符
- 删除 UWP 应用包标识符
- 删除 Defender 维护任务（Ubpm）
- 删除防火墙静态规则

### 10. **RemoveSignatureUpdates.reg** - 禁用签名更新
- 禁用实时签名交付
- 禁用从 Microsoft Update 强制更新
- 禁用启动时更新和电池模式更新
- 禁用更新后的自动扫描
- 配置签名更新追赶间隔

### 11. **RemoveStartupEntries.reg** - 移除开机启动项
- 从当前用户和全局启动项中移除 Windows Defender
- 从启动批准列表中移除安全健康服务
- 防止 Defender 在系统启动时自动运行

### 12. **RemoverofDefenderContextMenu.reg** - 移除右键菜单
- 删除"使用 Windows Defender 扫描"右键菜单选项
- 删除桌面背景右键菜单中的"Windows 安全"选项
- 删除 Shell 服务对象集成

### 13. **RemoveWindowsWebThreat.reg** - 移除网络威胁防护
- 删除网络威胁防护的 COM 组件
- 删除 WebThreatDefense 相关服务
- 禁用审计模式、密码重用通知
- 删除防火墙规则
- 删除 WTDS（Windows 威胁防御服务）组策略

### 14. **WindowsSettingsPageVisibility.reg** - 隐藏设置页面
- 在 Windows 设置应用中隐藏 Windows Defender 页面
- 用户无法通过设置界面访问 Defender 配置

---

## 🔧 使用建议

1. **完整移除流程：**
   - 运行主脚本 `Script_Run.bat` 会自动执行所有必要的注册表文件
   - 建议先创建系统还原点

2. **单独使用：**
   - 如需仅禁用特定功能，可单独运行对应的 .reg 文件
   - 双击 .reg 文件并确认导入即可

3. **执行顺序建议：**
   - 先运行策略禁用文件（DisableDefenderPolicies.reg）
   - 再运行服务移除文件（RemoveServices.reg）
   - 最后运行组件清理文件（RemovalofWindowsDefenderAntivirus.reg）

4. **重启系统：**
   - 所有更改需要重启系统后才能完全生效
   - 某些服务可能需要多次重启才能完全停止

## ⚠️ 重要提示

- 这些操作会**永久禁用** Windows Defender 的核心保护功能
- 系统将**不再受到**实时防病毒保护
- 建议在禁用前安装第三方防病毒软件
- 某些企业环境可能要求启用 Defender，请遵守组织政策
- 禁用缓解措施可能使系统更容易受到某些类型的攻击