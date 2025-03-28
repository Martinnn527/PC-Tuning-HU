# Tartalomjegyzék

- [1. Szükséges programok letöltése](#1-szükséges-programok-letöltése)
- [2. Munkakörnyezet előkészítése](#2-munkakörnyezet-előkészítése)
- [3. Nem használt verziók eltávolítása](#3-nem-használt-verziók-eltávolítása)
- [4. Mountold az ISO-t](#4-mountold-az-iso-t)
- [5. NET 3.5 bekapcsolása](#5-net-35-bekapcsolása)
- [6. Szükséges fájlok integrálása](#6-szükséges-fájlok-integrálása)
- [7. Unmount és Commit](#7-unmount-és-commit)
- [8. ISO zsugorítása](#8-iso-zsugorítása)
- [9. Átkonvertálás ISO-vá](#9-átkonvertálás-iso-vá)

## 1. Szükséges programok letöltése

- [7-Zip](https://www.7-zip.org/)

- [Windows ADK (Deployment Tools)](https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install)

## 2. Munkakörnyezet előkészítése

- Windows Defender-ben a Real-Time protection-t kapcsold mivel az lassíthatja a mount és unmount folyamatot, vagy hibát is okozhat.

- Nyisd meg a CMD-t adminként és hagyd nyitva mivel ideiglenes környezeti változókat állítunk be amelyek visszaállnak ha bezárod.

- Futtasd az alábbi parancsot. Ha error-t kapsz, indítsd újra a CMD-t admin jogokkal azonban ha nem ír semmit folytasd.

    ```bat
    DISM > nul 2>&1 || echo error: administrator privileges required
    ```

- Csomagold ki az ISO tartalmát egy neked tetsző directory-ba majd pedig add hozzá az ``EXTRACTED_ISO`` változóhoz. 
 
- Példa:

  ```bat
  set "EXTRACTED_ISO=C:\en_windows_7_professional_with_sp1_x64_dvd_u_676939"
  ```

- Állítsd be hova lesz mountolva az ISO.

  ```bat
  set "MOUNT_DIR=%temp%\MOUNT_DIR"
  ```

-  Állítsd be az ``OSCDIMG`` változót az ``oscdimg.exe`` elérési útjára. Ha a Windows ADK-t az alapértelmezett helyre telepítetted, nem kell a parancsot átírnod.

   ```bat
   set "OSCDIMG=C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe"
   ```

- Készítsd elő a ``MOUNT_DIR`` directory-t a mountolásra.

  ```bat
  > nul 2>&1 (DISM /Unmount-Wim /MountDir:"%MOUNT_DIR%" /Discard & rd /s /q "%MOUNT_DIR%" & mkdir "%MOUNT_DIR%")
  ```

- Ha a környezeti változok helyesen vannak konfigurálva akkor az alábbi parancsoknak ``true`` értéket kell mutatniuk.

  ```bat
  if exist "%EXTRACTED_ISO%\sources\install.wim" (echo true) else (echo false)
  ```
  ```bat
  if exist "%MOUNT_DIR%" (echo true) else (echo false)
  ```
  ```bat
  if exist "%OSCDIMG%" (echo true) else (echo false)
  ```

## 3. Nem használt verziók eltávolítása

Távolíts el minden nem kívánt verziót. Használd az alábbi parancsokat hogy megkapd az adott kiadás index-ét majd eltávolítsd azokat. A végére csak a telepíteni kívánt verziónak kell megmaradnia az 1-es indexen. Ajánlott minden verzió eltávolítása után futtatni a ``DISM /Get-WimInfo /WimFile:"%EXTRACTED_ISO%\sources\install.wim"`` parancsot hogy tisztán átlásd melyiket törlöd le.

 - Ajánlott verziók:

   - Professional/Pro

   - Windows Server esetén: Standard (Desktop Experience).

- Az összes elérhető verzió és a hozzájuk tartozó indexek lekérése:

  ```bat
  DISM /Get-WimInfo /WimFile:"%EXTRACTED_ISO%\sources\install.wim"
  ```
 
- Távolítsd el a verziót index alapján. Cseréld ki az ``<index>``-et az index számmal.

  ```bat
  DISM /Delete-Image /ImageFile:"%EXTRACTED_ISO%\sources\install.wim" /Index:<index>
  ```

## 4. Mountold az ISO-t

Mountold az ISO-t az alábbi parancssal.

```bat
DISM /Mount-Wim /WimFile:"%EXTRACTED_ISO%\sources\install.wim" /Index:1 /MountDir:"%MOUNT_DIR%"
```

## 5. NET 3.5 bekapcsolása

```bat
DISM /Image:"%MOUNT_DIR%" /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:"%EXTRACTED_ISO%\sources\sxs"
```

## 6. Szükséges fájlok integrálása

[Klónold a repository-t](https://github.com/Martinnn527/PC-Tuning-HU/archive/refs/heads/main.zip) majd a ``bin`` mappát másold be a mountolt directory-ba:

```bat
explorer "%MOUNT_DIR%"
```

A teljes elérési útnak ``C:\bin``-nek kell lennie.

Ilyenkor érdemes az ethernet driver-t is bemásolni/integrálni. Próbáld meg a driver-t INF formában megszerezni mivel az exe-k általában bloatware-t tartalmaznak. Néhány esetben 7-Zip-el ki tudod csomagolni az exe-t és azon belül megkeresni az INF fájlt.

## 7. Unmount és Commit

Zárd be a ``%MOUNT_DIR%`` mappát majd futtasd az alábbi parancsot a módosítások véglegesítéséhez az ISO-n:

```bat
DISM /Unmount-Wim /MountDir:"%MOUNT_DIR%" /Commit && rd /s /q "%MOUNT_DIR%"
```

## 8. ISO Zsugorítása

Ennek nincs különösen semmi előnye a méret csökkentésén kívül azonban telepítés közben a Windows Setup automatikusan végrehajtja ezt a folyamatot ami sok időbe telhet.

```bat
DISM /Export-Image /SourceImageFile:"%EXTRACTED_ISO%\sources\install.wim" /SourceIndex:1 /DestinationImageFile:"%EXTRACTED_ISO%\sources\install.esd" /Compress:recovery /CheckIntegrity && del /f /q "%EXTRACTED_ISO%\sources\install.wim"
```

## 9. Átkonvertálás ISO-vá

Használd az alábbi parancsot a kicsomagolt tartalom visszacsomagolásához egyetlen ISO fájlba, amely a ``C:\`` meghajtón fog létrejönni ``Final.iso`` néven.

```bat
"%OSCDIMG%" -m -o -u2 -udfver102 -l"Final" -bootdata:2#p0,e,b"%EXTRACTED_ISO%\boot\etfsboot.com"#pEF,e,b"%EXTRACTED_ISO%\efi\microsoft\boot\efisys.bin" "%EXTRACTED_ISO%" "C:\Final.iso"
```

---
