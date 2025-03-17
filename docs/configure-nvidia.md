# Tartalomjegyzék

- [1. Driver letöltése és feltelepítése](#1-driver-letöltése-és-feltelepítése)
- [2. NVIDIA Control Panel konfigurálása](#2-nvidia-control-panel-konfigurálása) 
    - [2.1 Manage 3D Settings](#21-manage-3d-settings)
    - [2.2 Change resolution](#22-change-resolution)
    - [2.3 Adjust Video Color Settings](#23-adjust-video-color-settings)
- [3. GPU Órajel lockolása (P-State 0)](#3-gpu-órajel-lockolásap-state-0)
- [4. NVIDIA Profile Inspector konfigurálása](#4-nvidia-profile-inspector-konfigurálása)
- [5. NVIDIA Display Container](#5-nvidia-display-container)   

## 1. Driver letöltése és feltelepítése

- [Töltsd le a legújabb Game Ready drivert](https://www.nvidia.com/en-us/drivers/) és csomagold ki 7-Zip-el egy külön mappába.

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

- Indítsd el a ``setup.exe``-t és telepítsd fel a drivert.


## 2. NVIDIA Control Panel konfigurálása

### 2.1 Manage 3D Settings

- Low Latency Mode - On

- Power management mode - Prefer maximum performance

- Shader Cache Size - Unlimited

- Texture filtering - High Performance

- Threaded Optimization - Off ([1](https://tweakguides.pcgamingwiki.com/NVFORCE_8.html)).

### 2.2 Change resolution

- Output dynamic range - Full

### 2.3 Adjust Video Color Settings

- Dynamic range - Full

## 3. GPU órajel lockolása/P-State 0

- Az alábbi registry key-el minimalizálhatod a GPU órajel ingadozását azonban magasabb idle hőfokokkal és energiafogyasztással jár. Amikor nem játszol fontold meg a [limit-nvpstate](https://github.com/valleyofdoom/limit-nvpstate) használatát.

  - A [Driver Key](/media/find-driver-key-example.png)-t cseréld ki a sajátodra majd másold be CMD-be az alábbi parancsot:

  ```bat
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
  ```

## 4. NVIDIA Profile Inspector konfigurálása

- Töltsd le és csomgaold ki az [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector)-t

- Kapcsold ki az ``Enable Ansel``-t

- Ha a Resizable BAR bevan kapcsolva, kísérletezhetsz a kényszerítésével nem támogatott játékokhoz. Fontos megjegyezni hogy számos játékban negatívan befolyásolhatja a teljesítményt ([1](https://www.techspot.com/review/2234-nvidia-resizable-bar)).

  - rBAR - Feature
  - rBAR - Options
  - rBAR - Size Limit

- Kapcsold ki a ``CUDA - Force P2 State`` opciót. Ez megakadályozza hogy a memória órajel frekvenciája csökkenjen CUDA-terhelés során, mivel a GPU a [Force P-State 0](#34-gpu-órajel-lockolásap-state-0) ellenére is belép ``P-State 2`` állapotba.

   - [cuda-force-p2-state-analysis.png](/media/cuda-force-p2-state-analysis.png)

## 5. NVIDIA Display Container

Tiltsd le az NVIDIA Display Container szolgáltatást az alábbi paranccsal.

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NVDisplay.ContainerLocalSystem" /v "Start" /t REG_DWORD /d "4" /f
``


