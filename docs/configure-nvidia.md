# Tartalomjegyzék

- [1. Driver letöltése és feltelepítése](#1-driver-letöltése-és-feltelepítése)
- [2. HDCP kikapcsolása](#2-hdcp-kikapcsolása)
- [3. NVIDIA Control Panel konfigurálása](#3-nvidia-control-panel-konfigurálása) 
    - [3.1 Manage 3D Settings](#31-manage-3d-settings)
    - [3.2 Change resolution](#32-change-resolution)
    - [3.3 Adjust Video Color Settings](#33-adjust-video-color-settings)
    - [3.4 GPU órajel lockolása/P-State 0](#34-gpu-órajel-lockolásap-state-0)
    - [3.5 NVIDIA Profile Inspector konfigurálása](#35-nvidia-profile-inspector-konfigurálása)
    - [3.6 NVIDIA Display Container LS Script](#36-nvidia-display-container-ls-script)

# 1. Driver letöltése és feltelepítése

- [Töltsd le a legújabb Game Ready drivert](https://www.nvidia.com/download/find.aspx) és csomagold ki 7-Zip-el egy külön mappába.

  - Törölj le mindent kivéve a következőket:

     ```
     Display.Driver
     NVI2
     EULA.txt
     ListDevices.txt
     setup.cfg
     setup.exe
     ```

  - Töröld ki az alábbi sorokat a ``setup.cfg``-ből (közel a fálj legalján található):

     ``` 
     <file name="${{EulaHtmlFile}}"/>
     <file name="${{FunctionalConsentFile}}"/>
     <file name="${{PrivacyPolicyFile}}"/>
    ```

- Az ``NVI2`` mappában található ``presentations.cfg``-t nyisd meg majd töröld ki a ``ProgressPresentationUrl`` és a ``ProgressPresentationSelectedPackageUrl`` értékét.

   ``` 
   <string name="ProgressPresentationUrl" value=""/>
   <string name="ProgressPresentationSelectedPackageUrl" value=""/>
   ```

- Indítsd el a ``setup.exe``-t.

- Amint végzett a telepítés, nyisd meg a CMD-t és másold be ezt a kettő parancsot:

    ```bat
    reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f
    ```
    ```bat
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup\SendTelemetryData" /t REG_DWORD /d "0" /f
    ```

# 2. HDCP kikapcsolása

Keresd ki a GPU driverhez tartozó [Driver Key](/media/find-driver-key-example.png)-t és cseréld ki a sajátoddal majd másold be CMD-be az alábbi parancsot:

```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
```

# 3. NVIDIA Control Panel konfigurálása

## 3.1 Manage 3D Settings

- Anisotropic Filtering - Off

- Antialiasing - Mode - Off

- Antialiasing - Gamma Correction - Off

- Low Latency Mode - On

- Power management mode - Prefer maximum performance

- Shader Cache Size - Unlimited

- Texture filtering - High Performance

- Threaded Optimization - Off ([1](https://tweakguides.pcgamingwiki.com/NVFORCE_8.html)).

## 3.2 Change resolution

- Output dynamic range - Full

## 3.3 Adjust Video Color Settings

- Dynamic range - Full

## 3.4 GPU órajel lockolása/P-State 0

- Az alábbi registry key-el minimalizálhatod a GPU órajel ingadozását azonban magasabb idle hőfokokkal és energiafogyasztással jár. Amikor nem játszol fontold meg a [limit-nvpstate](https://github.com/valleyofdoom/limit-nvpstate) használatát.

  - A [Driver Key](/media/find-driver-key-example.png)-t cseréld ki a sajátodra majd másold be CMD-be az alábbi parancsot:

  ```bat
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
  ```

## 3.5 NVIDIA Profile Inspector konfigurálása

- Töltsd le és csomgaold ki az [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector)-t

- Kapcsold ki az ``Enable Ansel``-t

- Ha a Resizable BAR bevan kapcsolva, kísérletezhetsz a kényszerítésével nem támogatott játékokhoz. Fontos megjegyezni hogy számos játékban negatívan befolyásolhatja a teljesítményt ([1](https://www.techspot.com/review/2234-nvidia-resizable-bar)).

  - rBAR - Feature
  - rBAR - Options
  - rBAR - Size Limit

- Kapcsold ki a ``CUDA - Force P2 State`` opciót. Ez megakadályozza hogy a memória órajel frekvenciája csökkenjen CUDA-terhelés során, mivel a GPU a [Force P-State 0](#34-gpu-órajel-lockolásap-state-0) ellenére is belép ``P-State 2`` állapotba.

   - [cuda-force-p2-state-analysis.png](/media/cuda-force-p2-state-analysis.png)

## 3.6 NVIDIA Display Container

Tiltsd le az NVIDIA Display Container szolgáltatást az alábbi paranccsal.

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NVDisplay.ContainerLocalSystem" /v "Start" /t REG_DWORD /d "4" /f
``


