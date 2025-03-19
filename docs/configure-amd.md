## 1. Tartalomjegyzék

   - [1. Tartalomjegyzék](#1-tartalomjegyzék)
   - [2. Driver feltelepítése](#2-driver-feltelepítése)
   - [3. Radeon Software konfigurálása](#3-radeon-software-konfigurálása)

## 2. Driver feltelepítése

- [Töltsd le](https://www.amd.com/en/support/download/drivers.html) és csomagold ki a legújabb ajánlott driver-t

- Helyezd a ``Packages\Drivers\Display\XXXX_INF`` mappát az asztalra. Driver verziónként eltérhet a neve.

- Nyisd meg a Device Manager-t -> Jobb klikk a a Display Adapter-re -> ``Update driver`` és válaszd ki a driver mappát.

- Csomagold ki az ``XXXX_INF\ccc2_install.exe`` fájlt és futtasd a ``CN\cnext\cnext64\ccc-next64.msi`` telepítőt hogy feltelepítsd a Radeon control panelt.

- Töltsd le az [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)-t és az ``Everything`` résznél tilts ki minden felesleges elemet mint például: ``AMD Crash Defender``, ``AMD External Events Utility`` (FreeSync működéséhez kell), stb. Figyelj hogy ne tilts le létfontosságú elemeket mint például a kernel-mode driver.

- Device Manager-ben tiltsd le a következőket:

  - High Definition Audio (Amelyik a GPU-hoz van csatlakoztatva: View -> Devices by connection)
  - AMD-Dynamic Audio Noise “Supression”
  - AMD Link Controller Emulation
  - AMD Streaming Audio Device
  - AMD UCM-UCSI Device

## 3. Radeon Software konfigurálása

Grapics oldal:

- Radeon Super Resolution: Off

- AMD Fluid Motion Frames: Off

- Radeon Anti-Lag: Off

- Radeon Boost: Off

- Radeon Chill: Off

- Radeon Image Sharpening: Off

- Radeon Enhanced Sync: Off

- Wait for Vertical Refresh: Off

- Minden más: Off/Legalacsonyabb

Display oldal:

- AMD FreeSync: Te döntésed

- Virtual Super Resolution: Off

- GPU Scaling: Off 

- Display Color Enhancement: Off

