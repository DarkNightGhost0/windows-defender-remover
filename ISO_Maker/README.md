#  ISO Maker / Unattended Installation
#  ISO 制作器 / 无人值守安装

This module allows you to create a Windows ISO with Windows Defender and Security Services disabled right from the start. 
此模块允许您创建一个从一开始就禁用 Windows Defender 和安全服务的 Windows ISO。

**Benefits:**
**优势：**

* Defender never runs, even during the first boot.
* Defender 永远不会运行，即使在首次启动时。

* Prevents Windows Update from reinstalling components during setup.
* 防止 Windows Update 在安装过程中重新安装组件。

* Ideal for creating a Defender free, installation media.
* 非常适合创建无 Defender 的安装介质。

## Instructions (If you're working on Windows DVD)
## 使用说明（如果您使用的是 Windows DVD）

To integrate Defender Remover into your Windows Installation media, follow these steps:
要将 Defender 移除器集成到您的 Windows 安装介质中，请按照以下步骤操作：

1.  **Extract the ISO:** Mount your Windows ISO and extract its contents to a folder on your PC.
1.  **提取 ISO：** 挂载您的 Windows ISO 并将其内容提取到电脑上的文件夹中。

2.  **Create the Folder Structure:**
2.  **创建文件夹结构：**

    Navigate to the `sources` folder inside your extracted ISO and create the following nested directory structure:
    导航到提取的 ISO 中的 `sources` 文件夹，并创建以下嵌套目录结构：

    ```text
    sources
    └── $OEM$
        └── $$
            └── Panther
    ```

    *Full path example:* `C:\ISOFolder\sources\$OEM$\$$\Panther\`
    *完整路径示例：* `C:\ISOFolder\sources\$OEM$\$$\Panther\`

3.  **Copy the XML:**
3.  **复制 XML 文件：**

    * Download the `unattend.xml` (or `autounattend.xml`) file from this folder.
    * 从此文件夹下载 `unattend.xml`（或 `autounattend.xml`）文件。

    * Place it inside the newly created `Panther` folder.
    * 将其放入新创建的 `Panther` 文件夹中。

4.  **Rebuild the ISO:**
4.  **重建 ISO：**

    Save the folder contents back as a bootable ISO using tools like AnyBurn or ImgBurn.
    使用 AnyBurn 或 ImgBurn 等工具将文件夹内容保存为可引导的 ISO。


## Instructions (if you're working on Windows USB Flash Drive)
## 使用说明（如果您使用的是 Windows USB 闪存驱动器）

1. **Make USB bootable with Rufus.**  
1. **使用 Rufus 使 USB 可引导。**  

2. **Create the Folder Structure:**
2. **创建文件夹结构：**

    Navigate to the `sources` folder inside your extracted ISO and create the following nested directory structure:
    导航到提取的 ISO 中的 `sources` 文件夹，并创建以下嵌套目录结构：

    ```text
    sources
    └── $OEM$
        └── $$
            └── Panther
    ```

    *Full path example:* `C:\ISOFolder\sources\$OEM$\$$\Panther\`
    *完整路径示例：* `C:\ISOFolder\sources\$OEM$\$$\Panther\`

3.  **Copy the XML:**
3.  **复制 XML 文件：**

    * Download the `unattend.xml` (or `autounattend.xml`) file from this folder.
    * 从此文件夹下载 `unattend.xml`（或 `autounattend.xml`）文件。

    * Place it inside the newly created `Panther` folder.
    * 将其放入新创建的 `Panther` 文件夹中。

    * Copy the autounattend.xml file to main folder of USB. (This will block to make in-place upgrades.)  
    * 将 autounattend.xml 文件复制到 USB 的主文件夹。（这将阻止进行就地升级。）  


## Important Note
## 重要提示

This method utilizes the `unattend.xml` mechanism of Windows Setup. Ensure you do not have conflicting unattended files if you are using other customization tools.
此方法利用 Windows 安装的 `unattend.xml` 机制。如果您使用其他自定义工具，请确保没有冲突的无人值守文件。