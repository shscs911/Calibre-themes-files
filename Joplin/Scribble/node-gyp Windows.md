node-gyp Windows

1. `npm uninstall -g node-gyp` , `npm uninstall node-gyp` from CMD as administrator.

2. Delete `C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp`, `
C:\Users\[Your_Username]\AppData\Roaming\npm\node_modules\node-gyp`, `C:\Users\[Your_Username]\.node-gyp`. You may have to unhide AppData as it is a hidden system folder.

3. Install [Python 2.7 ](https://www.python.org/ftp/python/2.7.15/python-2.7.15.amd64.msi)
	- When installing Python, add Python to path.
	- If Python 3.0 or above is installed, uninstall it before installing 2.7.
4. Install [Visual Studio 2017 Community](https://visualstudio.microsoft.com/pl/thank-you-downloading-visual-studio/?sku=Community), (using the "Desktop development with C++" workload). The option will be available in the installer.

5. Run `npm config set python python2.7` from Powershell as administrator. <span class="hidden">[Powershell is a dark blue Command Prompt thingy]

6. Run `npm config set msvs_version 2017` from Powershell as administrator.

7. Restart computer and run `npm install --global --production windows-build-tools` from Powershell as administrator.

8. Run `npm install -g node-gyp@latest` from Powershell as administrator.

9. Run `npm install node-gyp@latest` from Powershell as administrator.

> 10.Run `npm install -g embark@next` from Powershell as administrator to install Embark Framework for Dapp Development.