# PC-Tuning 
 
---

## Tartalomjegyzék

- [Bemutató](#bemutató)
- [Követelmények](#követelmények)
- [0. Benchmarkolás](#0-benchmarkolás)
- [1. Fizikális beállítás](#1-physical-setup)
  - [1.1 Általános információ](#11-általános-információ)
  - [1.2 Hűtés](#12-hűtés)
  - [1.3 Perifériák konfigurálása](#13-perifériák-konfigurálása)
  - [1.4 EMI minimalizálása](#14-emi-minimalizálása)
  - [1.5 USB Portok elrendezésének konfigurálása](#15-usb-portok-elrendezésének-konfigurálása)
- [2. BIOS](#2-bios) 
  - [2.1 BIOS frissítések](#21-bios-frissítések)
  - [2.2 CPU Microcode](#22-cpu-microcode-az-uefi-ben)
  - [2.3 BIOS Reset](#23-bios-reset)
  - [2.4 Resizable BAR](#24-resizable-bar)
  - [2.5 Rejtett beállítások elérése](#25-rejtett-beállítások-elérése)
  - [2.6 Hyper-Threading/Simultaneous Multithreading](#26-hyper-threadingsimultaneous-multithreading)
  - [2.7 Power Saving](#27-power-saving)
  - [2.8 Virtualization](#28-virtualization)
  - [2.9 Nem használt eszközök letiltása](#29-nem-használt-eszközök-letiltása)
  - [2.10 Trusted Platform Module](#210-trusted-platform-module)
  - [2.11 Secure Boot](#211-secure-boot)
  - [2.12 Fast Startup, Standby, Hibernation](#212-fast-startup-standby-és-hibernate)
  - [2.13 Spread Spectrum](#213-spread-spectrum)
  - [2.14 PCIe Link Speeds](#214-pcie-link-speeds)
  - [2.15 Statikus CPU frekvencia](#215-statikus-cpu-frekvencia)
  - [2.16 Ventilátor RPM](#216-ventilátor-rpm)
  - [2.17 HPET](#217-hpet)
  - [2.18 Software Installation](#218-software-telepítési-beállítások)
  - [2.19 Legacy USB Support](#219-legacy-usb-support)
  - [2.20 XHCI Hand-off](#220-xhci-hand-off)
  - [2.21 Execute Disable Bit/NX Mode](#221-execute-disable-bitnx-mode)
  - [2.22 BIOS Profilok és Backup](#222-bios-profil-és-backup)
- [3. Stabilitás, hangolás és hőfokok](#3-stabilitás-hangolás-és-hőfokok)
  - [3.1 Ideiglenes OS](#31-ideiglenes-os)
  - [3.2 Általános infó](#32-általános-infó)
  - [3.3 Hőmérsékletkezelés](#33-hőmérsékletkezelés)
  - [3.4 Load-Line Calibration](#34-load-line-calibration)
  - [3.5 GPU](#35-gpu)
  - [3.6 CPU/RAM](#36-cpuram)
  - [3.7 Stressz-tesztelő eszközök](#37-stressz-tesztelő-eszközök)
- [4. Telepítés előtti instrukciók](#4-telepítés-előtti-instrukciók)
  - [4.1 Windows verzió kiválasztása](#41-milyen-windows-verziót-használj)
  - [4.2 Eredeti ISO letöltése](#43-eredeti-iso-letöltése)
  - [4.3 ISO testreszabása (Opcionális)](#43-iso-testreszabása)
  - [4.4 Szükséges fájlok integrálása](#44-szükséges-fájlok-integrálása)
  - [4.5 Telepítés Ventoy használatával](#45-telepítés-pendrive-ról-ventoy-használatával)
  - [4.6 ISO-ba való bootolás](#46-iso-ba-való-bootolás)
  - [4.7 OOBE Setup](#47-oobe-setup)
- [5. Telepítés utáni instrukciók](#5-telepítés-utáni-instrukciók)
  - [5.1 Unrestricted PowerShell Execution Policy](#51-unrestricted-powershell-execution-policy)
  - [5.2 Process Mitigations](#52-process-mitigations-windows-10-1709)
  - [5.3 Registry Script](#53-registry-script)
  - [5.4 Driverek telepítése](#54-driverek-telepítése)
  - [5.5 Windows Server konfigurálása](#55-windows-server-konfigurálása)
  - [5.6 Privacy Options](#56-privacy-options)
  - [5.7 Search Indexing](#57-search-indexing)
  - [5.8 Idő, nyelv és régió](#58-idő-nyelv-és-régió)
  - [5.9 Böngésző konfigurálása](#59-böngésző-konfigurálása)
  - [5.10 Ütemezett feladatok kikapcsolása](#510-ütemezett-feladatok-kikapcsolása)
  - [5.11 Windows Aktiválása](#511-windows-aktiválása)
  - [5.12 Egyéb beállítások](#512-egyéb-beállítások)
  - [5.13 Runtime-ok feltelepítése](#513-runtime-ok-feltelepítése)
  - [5.14 Optional Features](#514-optional-features)
    - [5.14.1 NET 3.5](#5141-net-35)
  - [5.15 Tray Icons](#515-tray-icons)
  - [5.16 Hibernation](#516-hibernation)
  - [5.17 Bloatware kezelése](#517-bloatware-kezelése)
  - [5.18 7-Zip](#518-7-zip-letöltése-és-beállítása)
  - [5.19 GPU Driver](#519-gpu-driver)
  - [5.20 MSI Afterburner](#520-msi-afterburner)
  - [5.21 Felbontások és Scaling Mode](#521-felbontások-és-scaling-mode)
  - [5.22 Spectre, Meltdown és CPU Microcode](#522-spectre-meltdown-és-cpu-microcode)
  - [5.23 Power Plan](#523-power-plan)
  - [5.24 Memory Management beállítások](#524-memory-management-beállítások)
  - [5.25 NIC konfigurálása](#525-nic-konfigurálása)
  - [5.26 Audio eszközök beállítása](#526-audio-eszközök-beállítása)
  - [5.27 Process Explorer](#527-process-explorer)
  - [5.28 Device Manager beállítása](#528-device-manager-beállítása)
  - [5.29 Device Power Saving](#529-device-power-saving)
  - [5.30 Fájl rendszer](#530-fájl-rendszer)
  - [5.31 Event Trace Sessions](#531-event-trace-sessions)
  - [5.32 Message Signaled Interrupts](#532-message-signaled-interrupts)
  - [5.33 XHCI Interrupt Moderation](#533-xhci-interrupt-moderation-imod)
  - [5.34 Applikációk konfigurálása](#534-applikációk-konfigurálása)
    - [5.34.1 FPS Limit](#5341-fps-limit)
    - [5.34.2 Játék regisztrálása Game Bar-ban](#5452-játék-regisztrálása-game-bar-ban)
    - [5.34.3 Presentation Mode](#5343-presentation-mode)
    - [5.34.4 Game Mode](#5344-game-mode)
    - [5.34.5 Média lejátszó](#5345-media-lejátszó)
    - [5.34.6 QoS Policy](#5346-qos-policy)
    - [5.34.7 Discord](#5347-discord)
    - [5.34.8 Epic Games](#5348-epic-games)
    - [5.34.9 Steam](#5349-steam)
  - [5.35 Interruptok és DPC-k](#535-interruptok-és-dpc-k)
    - [5.35.1 GPU és DirectX Graphics Kernel](#5351-gpu-és-directx-graphics-kernel)
    - [5.35.2 XHCI és Audio Controller](#5352-xhci-és-audio-controller)
    - [5.35.3 Network Interface Card](#5353-network-interface-card-nic)   
  - [5.36 Event Viewer ellenőrzése](#536-event-viewer-ellenőrzése)
  - [5.37 CPU Idle States](#537-cpu-idle-states)
  - [5.38 Paging File](#538-paging-file)
  - [5.39 Cleanup és karbantartás](#539-cleanup-és-karbantartás)

## Bemutató

Ezen útmutató célja a Windows-alapú rendszerek finomhangolása, többek között a hardver-, operációs rendszer- és szoftverek konfigurálása. Az útmutatás széleskörű célok elérésére van kialakítva, beleértve a biztonság és adatvédelem javítása, azonban legfőképp a competitive játékokban való előny megszerzésére és valós idejű feladatok futtatására van kihegyezve. Hangsúlyt fektet arra, hogy a felhasználók saját maguk végezzék el a beállításokat, ellenőrizzék azok hatását, és minimalizálják a scriptek használatát annak érdekében hogy a folyamat átláthatóbb legyen, és elkerüljék a nem kívánt módosításokat. A szekciókat sorrendben kell követni mivel egyes lépések a korábbi lépések befejezésétől függnek, ezért minden szekció számozott.

## Követelmények

- Pendrive (Minimum 8 GB)
- Olvasási készség, szövegértés
- Directory-k navigálása CLI-ben
- Tudj parancsokat kimásolni és beilleszteni
- Internet használata segítségként

---

> [!CAUTION]
Hardver > BIOS > Operációs rendszer

> [!CAUTION]
**NE** alkalmazz random, ismeretlen vagy nem dokumentált beállítást, programot vagy scriptet anélkül hogy megértenéd az adott beállítás hatását a biztonságra, adatvédelemre és a teljesítményre.

# 0. Benchmarkolás

Ez az egyik legfontosabb része az útmutatónak. Benchmarkolás nélkül vakon állítasz be mindent és nem tudod az adott beállítás teljesítményre való hatását.

- [FrameView](https://www.nvidia.com/en-gb/geforce/technologies/frameview/) - [PC Latency](https://images.nvidia.com/content/images/article/system-latency-optimization-guide/nvidia-latency-optimization-guide-pc-latency.png)
- [Frame Latency Meter](https://github.com/GPUOpen-Tools/frame_latency_meter)
- [PresentMon](https://github.com/BoringBoredom/Frame-Time-Analysis/raw/main/presentmon/presentmon.zip) - Lásd a teljes listát [itt](https://github.com/GameTechDev/PresentMon/blob/main/README-CaptureApplication.md#metric-definitions)
- [XTW](https://github.com/valleyofdoom/xtw) - ISR/DPC végrehajtási idők ellenőrzése
- [Mouse Tester](https://github.com/valleyofdoom/MouseTester) - Egér teljesítményének mérése (pl. polling stabilitás)
- [NVIDIA Reflex Analyzer](https://www.nvidia.com/en-gb/geforce/news/reflex-latency-analyzer-360hz-g-sync-monitors/) - End-to-end latency
- [Frame-Time-Analysis](https://boringboredom.github.io/Frame-Time-Analysis/) - CSV adatok elemzése amit a fenti programok log-oltak

---


# 1. Fizikális beállítás

## 1.1 Általános információ

- Lehetőleg minden nagyobb alkatrészcsere után telepítsd újra a Windowst.

- Kerüld a csavarok túlfeszítését.

- Győződj meg róla hogy a kábelek rendesen bevannak dugva és nem lazák (legfőképp tápkábelek)

- Érdemes vezetékes eszközöket használni, mivel a vezetéknélküli eszközök hajlamosak aggresszív energiatakarékosságot alkalmazni a hosszabb akkumulátor élettartam érdekében, a túlzott EMI hátrányaival együtt.

- A [CrystalDiskInfo](https://crystalmark.info/en/software/crystaldiskinfo/) és [CrystalDiskMark](https://crystalmark.info/en/software/crystaldiskmark/) programmal megtekinthető az SSD állapota. 

- Frissítsd az SSD, NIC (Network Interface Controller), és a többi periféria firmware-ét.

- 4 DIMM-es alaplap esetében a kézikönyvben leírtak alapján szereld be a RAM modulokat a megfelelő foglalatokba. Legtöbb esetben ez a 2. és 4. slot.

- Használj PCIe portokat amelyek egyenesen a CPU-ba mennek a PCH helyett. Ez jellemzően a GPU-ra, M.2 és NVME SSD-re vonatkozik. [HWiNFO](https://www.hwinfo.com/)-ban a PCIe Bus kategóriánál, vagy az alaplapod oldalán lévő manual-ban a PCI részlegnél találod meg a kellő információt.

- Győződj meg róla, hogy a PCIe Bus kategóriába tartozó PCIe eszközök sebessége megegyezik a maximálisan támogatott értékkel, mint például ``x16 3.0``.

  - [Példa](/media/hwinfo-pcie-width-speed.png)

  - A nem P-State 0-ra korlátozott GPU-k esetében a kapcsolat sebessége csökkenhet miközben nincs terhelve. 

    - Ellenőrizd a [GPU-Z](https://www.techpowerup.com/gpuz/) programban a beépített renderelési teszt segítségével.

- Ha egynél több beépített NIC-ed van, érdemes azt használni amelyik támogatja az MSI-X-et, mivel ez szükséges az RSS ([Receive-Side-Scaling](https://learn.microsoft.com/en-us/windows-hardware/drivers/network/introduction-to-receive-side-scaling)) helyes működéséhez. Ezt a 
[GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) programban ellenőrizni tudod.

- Ragaszd le a laza kábelek végét, hogy csökkentsd az alkatrészek zárlatának kockázatát.

- Kerüld a feleslegesen hosszú kábelek használatát.

- Gyakran érdemes tisztítani az alkatrészeket és a hűtőbordákat, mivel ha porosak, csökkentik a légáramlást és zárlatot okozhatnak.

- Használj GPU támasztót (GPU Bracket) hogy elkerüld a PCIe slot sérülését.

- Kerüld a daisy chaining-et.

  - Lásd [Installation Remark for High Power Consumption Graphics Cards | Seasonic](https://knowledge.seasonic.com/article/8-installation-remark-for-high-power-consumption-graphics-cards)

- Fektess be magas minőségű HDMI/DisplayPort, ethernet és tábkábelekbe.

## 1.2 Hűtés

- Semmiképp se legyen a gép szőnyegen, vagy olyan helyen ahol nincs elegendő légáramlás.

- Használj magas minőségű hővezető pasztát és megfelelő mennyiséget.

  - Lásd [Best Thermal Paste for CPUs | Tom’s Hardware](https://www.tomshardware.com/best-picks/best-thermal-paste)

- Szereld be megfelelően az AIO-t.

  - Lásd [Stop Doing It Wrong: How to Kill Your CPU Cooler | Gamers Nexus](https://www.youtube.com/watch?v=BbGomv195sk)

- Ha heatsink nélküli NVME/M.2 SSD-t szerelsz be ügyelj arra hogy az alaplapon lévő thermal pad-ekről levedd a fóliát.

- Használj nem RGB-s ventilátorokat magas statikus nyomással.

  - Lásd [PC Fans | Calypto](https://docs.google.com/spreadsheets/d/1AydYHI_M6ov9a3OgVuYXhLEGps0J55LniH9htAHy2wU)

- A ventilátorok alaplapi csatlakoztatásánál fontos figyelembe venni a ventilátorcsatlakozó (fan header) terhelhetőségét, különösen ventilátor-elosztók (splitterek) használata esetén.
  
  - Az alaplapi ventilátorcsatlakozók általában 2A (24W) körüli áramerősséget bírnak, de ez alaplaponként eltérhet. Ha túl sok ventilátort csatlakoztatsz egyetlen headerre egy elosztóval, az túlterhelheti az áramkört, és akár meghibásodást is okozhat. Az RGB-s ventilátorok vagy egyes nagy teljesítményű ventilátorok még ennél is több áramot igényelhetnek. 

- Pasztázd újra a GPU-t és cseréld ki a gyári ventilátorokat ha nem megfelelőek.


## 1.3 Perifériák konfigurálása

- A legtöbb modern periféria támogatja az Onboard Memory Profile-t. Állítsd be őket mielőtt újratelepítenéd a Windowst, hogy ne kelljen a későbbi módosítások érdekében feltelepíteni a sok bloatware-t.

- Magasabb DPI csökkenti a latency-t. Ügyelj arra hogy sensor smoothing ne lépjen életbe magasabb DPI használatakor. Windowsban az egér beállítások közt lejjebb viheted a pointer speedet tetszésed szerint ha a játék raw inputot használ.

- Magasabb polling rate csökkenti a jittert, azonban 1000Hz-nél (1ms) magasabb polling rate hardvertől függően negatívan befolyásolhatja a teljesítményt, ezért ennek megfelőlen kell beállítani. Ez nem akkora probléma a 2023 májusi Windows 11 Raw Input Stack update után ami limitálja a nem előtérben lévő programok polling frekvenciáját 125hz-re (8ms).

- Az USB kimenet ~7A-ra van korlátozva, és az RGB felesleges energiát igényel. Fontold meg az RGB kikapcsolását, mivel az effektek/animációk nagy terhet tesznek az MCU-ra (Micro Controller Unit), és késleltethetik a többi folyamatot.

- Sűrített levegővel tisztítsd az egér szenzorát.

## 1.4 EMI minimalizálása

"EMI", azaz "Elektromágneses interferencia" olyan zavaró jeleket vagy zajt jelent, amelyeket elektromágneses mezők okoznak. Ezek a zajok általában más elektronikai eszközökből vagy külső forrásokból származnak, és befolyásolhatják az elektronikai berendezések működését. Az EMI problémák gyakran akkor merülnek fel, amikor az elektronikai berendezések közel vannak egymáshoz vagy erős elektromágneses mezők vannak jelen, pl. nagyfeszültségű vezetékek, modemek, vagy vezeték nélküli eszközök.

- Az ilyen "problémás" eszközöket, például mobiltelefonokat (airplane mode is egy megoldás), routereket stb. tedd messzebb a setuptól.

- Gondoskodj arról, hogy a kábelek között mérsékelt távolság legyen a "coupling" kockázatának csökkentése érdekében. Ez akkor fordul elő amikor két vagy több kábel túl közel van egymáshoz, és az elektromos jelek áttérnek az egyik vezetékről a másikra, ami interferenciához vezet.

- Használd vezetékesen a perifériáid.

- Húzd ki az alaplapból a felesleges eszközöket, perifériákat, mint például LED-ek, RGB, előlapi csatlakozók, nem használt HDD-k.

- Ethernet kábel vásárlásnál ajánlatos árnyékolt kábelt venni mivel ezek olyan kialakítással rendelkeznek ami segít kizárni a zavaró jeleket, amelyek befolyásholhatják a hálózati adatvitelt.

## 1.5 USB portok elrendezésének konfigurálása

- Használd a kívánt XHCI Controller első néhány portját. Előfordulhat, hogy némelyikük fizikailag nem megállapítható, amit az [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) programban megnézhetsz.

  - A Ryzen-es rendszerek rendelkeznek egy vagy több XHCI-controller-rel, amely közvetlenül a CPU-hoz csatlakozik. Ez [HWiNFO](https://www.hwinfo.com/)-ban a ``Bus`` kategóriában azonosítható. 

     - [Példa](/media/ryzen-xhci-controller.png)      

- Ha egynél több XHCI Controller-ed van, akkor az olyan eszközöket, mint például az egér, billentyűzet, és fejhallgató, egy másik controller-re különítheted el, hogy azok ne zavarják a polling konzisztenciáját.

- Kerüld a Root Hub-on belüli USB Hub-ok használatát.
  
  - [Példa](/media/usb-hub-internal-headers.png)

---

# 2. BIOS

> [!CAUTION] 
Fontos, hogy a módosított beállítások valóban pozítívan befolyásolják a teljesítményt (Lásd: [Benchmarkolás](#0-benchmarkolás)). Mielőtt belekezdesz, ajánlott alaphelyzetbe állítani a BIOS-t hogy tiszta lappal indulj ha esetleg valami rosszul volt beállítva.

>[!CAUTION]
Szintén fontos hogy a BIOS módosítása mindig kockázattal jár, ezért körültekintően folytasd.

## 2.1 BIOS frissítések

Ellenőrizd hogy van e frissebb BIOS és hogy van e pozitív változás, mint például stabilabb memória, azonban figyelj oda a fórumokon felvetett problémákra az adott BIOS verzióval kapcsolatban.

## 2.2 CPU Microcode az UEFI-ben

Frissítés után az [InSpectre](https://www.grc.com/inspectre.htm) programmal ellenőrizd hogy a Spectre, Meltdown és CPU Microcode státusza rendben van magán az operációs rendszeren. Ha problémába ütköznél akkor lehet, hogy BIOS szinten kell visszaállítanod a CPU Microcode-ot, azonban számos alaplapon egyáltalán nem elérhető ez a beállítás.

## 2.3 BIOS Reset

Ha a CMOS reset nem állítja teljes mértékben alaphelyzetbe a BIOS-t, flasheld újra.

## 2.4 Resizable BAR

- ``Above 4G Encoding`` engedélyezése szükséges a működéséhez

- Csak RTX 3000 és annál újabb GPU-kon támogatott.

- Ellenőrizd a Resizable BAR státuszát [GPU-Z](https://www.techpowerup.com/gpuz)-ben.

Fontos megjegyezni hogy néhány játékban a ReBAR használata negatívan befolyásolhatja a teljesítményt [(1)](https://www.techspot.com/review/2234-nvidia-resizable-bar/) ezért végezz [benchmark](#0-benchmarkolás)-okat.

## 2.5 Rejtett beállítások elérése

Számos alaplap gyártó elrejt sok hasznos beállítást. A legegyszerűbb megoldás erre az hogy az UEFI-ben lévő összes látható beállítást konfigurálod majd pedig [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-ben a maradék rejtett beállítással folytatod.

  - [Töltsd le a SCEWIN-t](https://github.com/ab3lkaizen/SCEHUB/releases/download/1.2.0/DL_SCEWIN.exe)
  - Csomagold ki, majd futtasd az ``Export.bat`` fájlt
  - Exportálás után az ``NVRAM.txt`` megnyitásával láthatóvá válik az összes beállítás
  - A változó típusától függően helyezd a ``*`` jelet a kívánt opcióhoz vagy írd át az értékét
  - Az ``Import.bat`` futtatásával elmented a beállításokat amelyek egy újraindítás után életbe lépnek
  - Hiba esetén lásd: [Solutions for various error messages](https://github.com/ab3lkaizen/SCEHUB?tab=readme-ov-file#solutions-for-various-error-messages)

Vedd figyelembe hogy alaplap márkától, akár BIOS verziótól függően eltérhetnek az adott beállítás nevei, például: ``C-States``, ``C State``, ``C-State`` stb. 

## 2.6 Hyper-Threading/Simultaneous Multithreading

Kapcsold ki a [Hyper-Threading/Simultaneous Multithreading](https://en.wikipedia.org/wiki/Hyper-threading) funkciót. Ez például renderelés esetén hasznos lehet de mivel a CPU-nkénti több végrehajtó thread használtata növeli a processzor erőforrásainak igénybevételét, jóval nagyobb hőfokokkal jár és a rendszer nagyobb latencyjének, jitterének forrása. Ha elegendő CPU-val rendelkezel a játék futtatásához (minimum 6), mindenféleképpen kapcsold ki. Ez a koncepció alkalmazható az Intel E-coreok esetében is.

## 2.7 Power Saving

- Kapcsold ki a C-States-eket.
  
  - Ellenőrizd a C-State residency-t [HWiNFO](https://www.hwinfo.com/)-ban
  
- Kapcsold ki az összes Power Saving funkciót, mint például: ASPM (Active State Power Management), ALPM (Aggressive Link Power Managemenet), DRAM Power Down, Hibernation, Clock Gating, Power Gating, PCIe Power Management Keresd a "power management", "power saving" kifejezéseket.  

## 2.8 Virtualization

Kapcsold ki a Virtualization/SVM Mode, Intel VT-d/AMD-Vi, IOMMU beállításokat mivel ezek a memória hozzáférés késeltetését növelhetik. A Virtualization szintén hatással lehet a BCLK-ra.
   
  - Ellenőrizd a Virtualization-t Task Manager-ben.

## 2.9 Nem használt eszközök letiltása

Kapcsold ki az összes nem használt eszközt, mint például nem használt NIC-ek, Bluetooth, WiFi, High Definition Audio (ha nem használsz alaplap audio-t), iGPU, SATA (és RAM slotok).

## 2.10 Trusted Platform Module

Kapcsold ki a Trusted Platform Module-t (TPM), mert előfordulhat, hogy a rendszer System Management Mode-ba (SMM) kerül a System Management Interruptok (SMI) [1](https://www.youtube.com/watch?v=X72LgcMpM9k&t=2060s) miatt. Ezek olyan nagy prioritású, leállíthatatlan hardveres megszakítások, amelyek azonnal felfüggesztik a CPU összes többi tevékenységét. 

  - Windows 11-en néhány anti-cheat (Vanguard, FACEIT) működéséhez bekapcsolva kell hagyni.

  - Ellenőrizd a TPM állapotát : ``Win+R`` -> ``tpm.msc``

## 2.11 Secure Boot

Kapcsold ki a Secure Boot-ot. (Windows 11-en a Vanguard, FACEIT, igényli a bekapcsolva hagyását.)

  - ``Win+R`` -> ``msinfo32``-ben tudod ellenőrizni az állapotát.

## 2.12 Fast Startup, Standby és Hibernate

Ez leginkább személyes preferencia kérdése. Vannak, akik nem használják a Fast Startup-ot, Standby-t vagy Hibernation-t, mert ezek néha váratlan problémákat okozhatnak ([magyarázat](https://www.youtube.com/watch?v=OBGxt8zhbRk)). Ehelyett inkább tiszta rendszerindítást részesítenek előnyben, így nem mentik és állítják vissza a kernel és a szoftverek állapotát és korlátozzák a rendszer energiaállapotait S0-ra (működő állapot) és S5-re (alvó állapot).
A rendszer energiaállapotairól [itt](https://learn.microsoft.com/en-us/windows/win32/power/system-power-states) tudhatsz meg többet. A BIOS-ban ezek az opciók gyakran Fast Startup, Suspend to RAM, S-States (S1, S2, S3, S4, S5), Standby, Memory Fast Boot, Hibernation vagy hasonló néven szerepelnek.

Ellenőrizd a változásokat a következő paranccsal:

```bat
powercfg /a 
```

## 2.13 Spread Spectrum

Kapcsold ki a Spread Spectrumot és győződj meg róla hogy a BCLK Frequency a lehető legközelebb van a 100-hoz. [HWiNFO](https://www.hwinfo.com/)/[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)-ban ellenőrizni tudod.

## 2.14 PCIe Link Speeds

PCIe Link Speed-et tedd a lehető legmagasabbra, mint például Gen 4, stb.
  
  - Keresd a ``PCIe Speed``, ``Gen4`` kifejezéseket.

## 2.15 Statikus CPU frekvencia

Ha statikus frekvenciát/feszültséget konfigurálsz a CPU-hoz, kapcsold ki a dynamic frequency funkciókat mint például a SpeedShift, SpeedStep, és állítsd az AVX Offset-et 0-ra, vagy tedd ``Disabled``-re. Precision Boost Overdrive (PBO) a Ryzen CPU-k esetében a statikus frekvencia és feszültésg alternatívája.

  - Egyes esetekben a fent említett beállítások megakadályozhatják, hogy a processzor a BIOS-ban történő manuális beállítás ellenére is túllépje az alapfrekvenciát. Ennek megfelelően állítsd be, ha ez előfordul, és [HWiNFO](https://www.hwinfo.com/)-ban ellenőrizd az órajeleket.

## 2.16 Ventilátor RPM

Konfiguráld a fan speedeket. állíts be egy [fan curve](https://imgur.com/a/ultimate-fan-speed-curve-by-kgtc-iteration-1-fr-en-de-ru-ar-es-hu-kr-sw-etc-https-translate-google-com-2UDYXp0)-öt vagy egy statikus, magas RPM-et.

## 2.17 HPET

Kapcsold be a High Precision Event Timer-t. 
  
  - Újabb AMD-s rendszereken nincs hatása ennek a beállításnak.

## 2.18 Software telepítési beállítások

Ha automatikus software telepítéssel kapcsolatos beállítást találsz (pl. ASUS Armoury Crate, MSI Utility) kapcsold ki.

## 2.19 Legacy USB Support

Kapcsold ki a Legacy USB Support-ot. Lehetséges hogy be kell kapcsolnod hogy új operációs rendszert telepíts fel vagy hogy hozzáférj a BIOS-hoz.

## 2.20 XHCI Hand-off

Kapcsold ki az XHCI Hand-off-ot.

## 2.21 Execute Disable Bit/NX Mode

Kapcsold ki az Execute Disable Bit/NX Mode-ot.

## 2.22 BIOS Profilok és Backup

Mentsd le a jelenlegi BIOS profilodat hogyha valamilyen oknál fogva alaphelyzetbe kell állítani akkor ne kelljen előről kezdened az egészet. A legtöbb alaplapon egy mentett profil betöltése CMOS reset után nem mindig fogja az összes beállítást visszaállítani úgy ahogy volt, ezért ajánlatos [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-el exportálni a jelenlegi profilod majd reset után újra exportálni és összehasonlítani a két NVRAM fájlt [Notepad++ Compare Plugin](https://sourceforge.net/projects/npp-compare/)-al vagy [Visual Studio Code](https://code.visualstudio.com/download)-al.

---

# 3. Stabilitás, hangolás és hőfokok

## 3.1 Ideiglenes OS

Ajánlott egy ideiglenes OS-t feltelepíteni/dual-bootolni amin OC-zol és stressz tesztelsz hogy elkerüld a fő OS-ed meghibásodását. RAM stressz teszt esetén így még több RAM-ot tudsz tesztelni mivel a háttérben futó programok nem használnak felesleges memóriát. A Safe Mode minimális tesztelési környezetként is szolgálhat de előfordulhat hogy bizonyos szoftverek nem fognak működni.

## 3.2 Általános infó

- Szoftveren belül ellenőrizd a változtatásokat a váratlan eredmények elkerülése érdekében (pl. frekvencia, feszültség, timing-ok)

- Overclockolás közben minden változtatás előtt mentsd el a BIOS profilod, hogy ne kelljen előről kezdeni ha esetleg reset-elni kell a CMOS-t. Lásd [BIOS Profilok és backup](#222-bios-profilok-és-backup)

- Egyetlen-egy error vagy crash is túl sok. Figyeld a WHEA-kat a [HWiNFO](https://www.hwinfo.com/) hibaszámlálójával vagy konfigurálj egy Event Viewer filter-t.

- Figyeld a feszültségeket az esetleges overvolting elkerülése érdekében.

- Számtalan tényező járul hozzá a stabilitáshoz, mint például hőmérséklet, energiaellátás, hardver minősége és még sok más.

- Az Overclock-olás nem feltétlen jár jobb teljesítménnyel az error correction miatt.

## 3.3 Hőmérsékletkezelés

Kerüld a thermal trotthling-et minden áron. Underclock-olj ha a hűtőd nem megfelelő. Egy stabil hőmérsékléten futó alkatrész alacsonyabb frekvenciával sokkal előnyösebb mint egy magasabb frekvencián futó viszont túlmelegedő alkatrész. 

  - Lásd [RAM Overclock Stability and Heat Management | buildzoid](https://www.youtube.com/watch?v=iCD0ih4qzHw)

## 3.4 Load-line Calibration

Ez nem egy ajánlás hogy milyen LLC mode-ot használj, inkább csak informatív okokból van itt.

  - [VRM Load-Line Visualized | ElmorLabs](https://elmorlabs.com/2019-09-05/vrm-load-line-visualized/)
  - [Vdroop setting and it's impact on CPU operation | xDevs](https://xdevs.com/guide/e399ocg/#vdroop)
  - [Why Vdroop is good for overclocking and taking a look at Gigabyte's Override Vcore mode | buildzoid](https://www.youtube.com/watch?v=zqvNkh4TVw8)

## 3.5 GPU

GPU overclockolásnál előfordulhat hogy számos power limit-et fel kell oldanod.

  - NVIDIA rendszereken kapcsold ki a ``CUDA - Force P2 State``-et [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector)-ban hogy elkerüld a memory downclock-ot stressz teszt közben.
  
  - Lásd [A Slightly Better Way To Overclock and Tweak Your Nvidia GPU | Cancerogeno](https://docs.google.com/document/d/14ma-_Os3rNzio85yBemD-YSpF_1z75mZJz1UdzmW8GE/edit?tab=t.0)
  - Lásd [LunarPSD/NvidiaOverclocking](https://github.com/LunarPSD/NvidiaOverclocking/blob/main/Nvidia%20Overclocking.md)

## 3.6 CPU/RAM

- Győződj meg róla hogy a CPU a megfelelő frekvencián fut mielőtt belekezdesz abban az esetben ha kikapcsoltad a SpeedStep és SpeedShift-hez hasonló beállításokat ami megakadályozhatja a CPU-t hogy túllépje az alapfrekvenciát.

- Konfiguráld a RAM frekvenciát és timing-okat manuálisan jelentős teljesítménybeli javulásért [(1)](https://kingfaris.co.uk/blog/intel-ram-oc-impact). Az XMP nem hangol be nagyon sok timing-ot és nem is garantál stabilitást.

   - Lásd [Eden’s DDR4 guide](https://web.archive.org/web/20231211232729/https://cdn.discordapp.com/attachments/328891236918493184/1172922515962724444/DDR4_Guide_V1.2.1.pdf)
   - Lásd [KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT](https://github.com/KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT)
   - Lásd [integralfx/MemTestHelper](https://github.com/integralfx/MemTestHelper/blob/oc-guide/DDR4%20OC%20Guide.md)

## 3.7 Stressz-tesztelő eszközök

- [StresKit](https://github.com/valleyofdoom/StresKit) (bootolható)

- Linpack

  - [StresKit](https://github.com/valleyofdoom/StresKit)
  - [Linpack-Extended](https://github.com/BoringBoredom/Linpack-Extended)
  - [Linpack Xtreme Bootable](https://www.techpowerup.com/download/linpack-xtreme)
  
- [Prime95](https://www.mersenne.org/download)

- [FIRESTARTER](https://github.com/tud-zih-energy/FIRESTARTER)

- [y-cruncher](http://www.numberworld.org/y-cruncher)

- [Memory Testing Software](https://github.com/integralfx/MemTestHelper/blob/oc-guide/DDR4%20OC%20Guide.md#memory-testing-software)

  - [HCI](https://hcidesign.com/memtest)
  - [MemTest86](https://www.memtest86.com) (bootolható)
  - [MemTest86+](https://memtest.org) (bootolható)

- [UNIGINE Superposition](https://benchmark.unigine.com/superposition)

- [OCCT](https://www.ocbase.com)

- [memtest_vulkan](https://github.com/GpuZelenograd/memtest_vulkan)  

---

# 4. Telepítés előtti instrukciók

## 4.1 Milyen Windows verziót használj?

- A Windows régebbi verzióiból hiányzik az anti-cheat támogatás, driver támogatás (legfőképp GPU, NIC) és alkalmazások támogatása. Lásd az alábbi táblázatot.

    |GPU|Minimum Windows Verzió|
    |---|---|
    |NVIDIA 10-es és régebbi szériák|Majdnem az összes Windows verzió támogatja|
    |NVIDIA 16, 20-as széria|Win7, Win8, Win10 1709+|
    |NVIDIA 30-as széria|Win7, Win10 1803+|
    |NVIDIA 40-es széria|Win10 1803+|
    |AMD|Lásd a driver oldalát|

- Windows Server nem támogatja a fogyasztói NIC-ek nagy részét. Az [ehhez](https://github.com/loopback-kr/Intel-I219-V-for-Windows-Server) hasonló megoldási lehetőségekre viszont felfigyel az anti-cheat a driver érvénytelen [tanúsítványa](https://learn.microsoft.com/hu-hu/windows-hardware/drivers/dashboard/code-signing-cert-manage) miatt.

- Windows 11-en néhány játék/anti-cheat működéséhez (Vanguard, FACEIT) kötelező bekapcsolni a TPM 2.0-át és a Secure Boot-ot Windows 10-el ellentétben.

- NVIDIA DCH driver-ek Windows 10 1803 és annál feljebb támogatottak.

- Médialejátszás során kizárólag Windows 10 1709-en a Multimedia Class Scheduler Service (MMCS) felemeli a timer resolution-t 0.5ms-re ami megakadályozza a használni kívánt timer resolution beállítását.

- Windows 10 1809+ szükséges a Ray Tracing-hez NVIDIA GPU-kon.

- Windows 10 2004+ szükséges a [Hardware Accelerated GPU Scheduling](https://devblogs.microsoft.com/directx/hardware-accelerated-gpu-scheduling/) használatához ami létfontosságú a DLSS Frame Generation működéséhez [(1)](https://developer.nvidia.com/rtx/streamline/get-started).

- Windows 10 2004-22H2 már nem támogatott a Global Timer Resolution [(1)](https://randomascii.wordpress.com/2020/10/04/windows-timer-resolution-the-great-rule-change/). A Microsoft lehetővé tette hogy Windows Server 2022+ és Windows 11-en vissza lehessen állítani a Global Timer Resolutiont egy registry key segítségével. 

- Windows 11-nek van egy frissített scheduler-je Intel 12th Gen és felette lévő CPU-k számára [(1)](https://www.anandtech.com/show/16959/intel-innovation-alder-lake-november-4th/3) azonban ezt replikálni lehet manuális affinity policy-k beállításával bármelyik Windows verzión.

- Windows 11 limitálja a háttérben lévő folyamatok polling rate-jét 125Hz-re [(1)](https://blogs.windows.com/windowsdeveloper/2023/05/26/delivering-delightful-performance-for-more-than-one-billion-users-worldwide/).

- AllowTelemetry-t 0-ra lehet állítani Windows Server verziókon [(1)](https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.DataCollection::AllowTelemetry).

- Windows Home verziók nem támogatják a Group Policy Editor-t ami szükséges lesz a rendszer konfigurálásához.

- Windows Server verziók nem támogatják az Xbox controllereket (Driver feltelepítése nélkül nem egyáltalán nem működik) valamint PlayStation controllerek esetén a DS4 programot (Senki nem használja :D).

- Windows Server-en nincs Game Bar, Game Mode és ehhez hasonló funkciók.

## 4.2 Eredeti ISO letöltése

Használd a ``certutil -hashfile <file>`` parancsot hogy ellenőrizd az ISO valódiságát/korruptságát. 

- Megbízható ISO források:
 
  - [os.click](https://os.click/en)
  - [New Download Links](https://docs.google.com/spreadsheets/d/1zTF5uRJKfZ3ziLxAZHh47kF85ja34_OFB5C5bVSPumk/edit?gid=0#gid=0)
  - [Adguard File List](https://files.rg-adguard.net/version/f0bd8307-d897-ef77-dbd6-216fefbe94c5)
  - [Server 2022](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2022)

## 4.3 ISO Testreszabása (Opcionális)

Útmutatás az ISO testreszabására DISM használatával: [docs/iso-testreszabasa.md](/docs/iso-testreszabasa.md)

## 4.4 Szükséges fájlok integrálása

[Klónold a repository-t](https://github.com/Martinnn527/PC-Tuning-HU/archive/refs/heads/main.zip) majd a ``bin`` mappát másold át a Pendriveodra.

A teljes elérési útnak ``C:\bin``-nek kell lennie.

Ilyenkor érdemes az ethernet driver-t is bemásolni. Próbáld meg a driver-t INF formában megszerezni mivel az exe-k általában bloatware-t tartalmaznak. Néhány esetben 7-Zip-el ki tudod csomagolni az exe-t és azon belül megkeresni az INF fájlt.

## 4.5 Telepítés Pendrive-ról Ventoy használatával

Töltsd le a [Ventoy](https://github.com/ventoy/Ventoy/releases)-t majd indítsd el a ``Ventoy2Disk.exe``-t. Az ``Option`` menüpontnál válaszd ki a partíciótípust (GPT) és kapcsold ki a Secure Boot support-ot, majd válaszd ki a pendrive-od és kattints az Install-ra. Ha végzett, másold át az ISO-t a pendriveod-ra.

## 4.6 ISO-ba való bootolás

Mielőtt még elkezdenéd a telepítést, fontold meg a Secure Erase használatát a BIOS-ban.

  - Lásd: [How to securely erase an SSD | Tom's Hardware](https://www.tomshardware.com/how-to/secure-erase-ssd-or-hard-drive)

Húzd ki az ethernet kábeledet és ne legyél az internethez csatlakozva, ezáltal elkerülhetjük a Microsoftba való bejelentkezést OOBE közben és a Windows nem fog automatikusan feltelepíteni frissítéseket és drivereket.

- Ha a Secure Boot bevan kapcsolva, ideiglenesen kapcsold ki a telepítési folyamathoz mivel problémákat okozhat. Bootolj be a pendrive-ra BIOS-on belül és válaszd ki az ISO-t.

## 4.7 OOBE Setup

- Windows Server telepítése során meg kell adnod egy komplex jelszót amit törölhetsz később.

- Ha Windows 11-et telepítesz nyomj egy ``Shift+F10``-et hogy megnyisd a CMD-t és írd be a következő parancsot: ``oobe\BypassNRO.cmd``. Ezáltal megjelenik a ``Continue with limited setup`` opció. Folytasd a setup-ot a megszokottak szerint. Amiután végzett a telepítés kapcsold ki a Secure Boot-ot ha előzőleg bevolt.

---

# 5. Telepítés utáni instrukciók

> [!CAUTION] 
Fontos, hogy a módosított beállítások valóban pozítívan befolyásolják a teljesítményt (Lásd: [Benchmarkolás](#0-benchmarkolás)).

## 5.1 Unrestricted PowerShell Execution Policy

Ez szükséges a scriptek futtatásának engedélyezésére. Nyisd meg a PowerShell-t és másold be az alábbi parancsot. Válaszd ki a "Yes to all" opciót ("A" betű).

```powershell
Set-ExecutionPolicy Unrestricted
```

## 5.2 Process Mitigations (Windows 10 1709+)

Ez alapból bevan kapcsolva és negatívan befolyásolja a teljesítményt. Ha nem szeretnél scripteket futtatni, akkor Windows Defender-ben az ``Exploit Protection`` oldalon ki lehet ezeket kapcsolni. Vedd figyelembe hogy a következő lépésben a Defender ki lesz kapcsolva ezáltal nem lesz elérhető a GUI hogy visszakapcsold azonban a [Set-ProcessMitigation](https://learn.microsoft.com/en-us/powershell/module/processmitigations/set-processmitigation?view=windowsserver2025-ps) használható PowerShell-ben.

Az alábbi script-tel szintén kikapcsolható a Process Mitigation. Nyisd meg a CMD-t adminként majd pedig másold be az alábbi parancsot.

```bat
C:\bin\disable-process-mitigations.bat
```

## 5.3 Registry Script

A beállítások módosíthatók a ``bin`` mappában lévő ``registry-options.json`` módosításával (az értékek ``true`` és ``false``). Ha kifejezetten játékra használod a rendszert ajánlott nem hozzá nyúlni mivel az alap configban minden ``true`` értékre van állítva.

- Nyisd meg a PowerShell-t adminként majd másold be az alábbi parancsot. Ha error-t kapsz, kapcsold ki a Tamper Protection-t és Real-Time Protection-t Windows Defenderben. Ha ugyanúgy error-t kapsz, boot-olj be Safe Mode-ba és futtasd ott.

  ```powershell
  C:\bin\apply-registry.ps1
  ```

- Győződj meg róla hogy a script egy "succesfully applied" üzenetet ír. 

- Csakis egy újraindítás után csatlakozz az internethez.

## 5.4 Driverek telepítése

- GPU driverek később lesznek feltelepítve.

- NIC (Network Interface Controller) drivert telepítsd fel lehetőleg INF-ként Device Manager-ben, ahogy [itt](#48-szükséges-fájlok-integrálása) levan írva.

- Ha teheted [telepíts fel egy külön XHCI/USB driver-t](https://winraid.level1techs.com/t/outdated-usb-3-0-3-1-drivers-original-and-modded/30871) mivel a [Microsoftos jóval magasabb DPC latency-vel jár](/media/driver-example.png). Ez egy viszonylag kockázatos folyamat mivel a modern hardvereknek nincs külön, dedikált drivere ezért régebbieket kell feltelepíteni ami nem 100% hogy működik, és akár tönkre is teheti az operiációs rendszert. Vedd figyelembe hogy néhány driver nem WHQL-tanusított, azaz nem a Microsoft írta alá és a Secure Boot miatt ezáltal nem töltődik be boot-nál, tehát nem lesz egér, billentyűzet stb.

## 5.5 Windows Server konfigurálása

- Server Manager-ben menj a ``Manage -> Server Manager Properties``-be és pipáld be a ``Do not start Server Manager automatically at logon`` opciót.

- ``Win+R -> services.msc``, keresd ki a ``Windows Audio`` és ``Windows Audio Endpoint Builder`` szolgáltatásokat majd pedig a startup type-ot tedd Automatic-ra.

- ``Win+R -> gpedit.msc -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`` és kapcsold ki a ``Password must meet complexity requirements`` opciót.

   - CMD-be írd be hogy: ``gpupdate /force``, így egyből életbe lépnek a változások.

- ``Win+R`` -> ``control userpasswords`` -> ``Users`` majd jobb klikk az ``Administrator``profilra, ``Set Password`` és hagyd üresen hogy eltávolítsd a jelszót.

- Windows Server-en globálisan kikapcsolható a Telemetry az alábbi CMD paranccsal azonban ha a ``registry-options.json``-ban ``true``-ra van állítva a ``disable telemetry`` ez a registry key már jelen van.

  ```bat
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f
  ```

## 5.6 Privacy Options

``Win+I`` -> ``Privacy`` és kapcsolj ki minden nem használt engedélyt.

## 5.7 Search Indexing

Bizonyos könyvtárak a fájlrendszeren indexelve vannak a Windows keresési funkcióihoz, amelyeket ``Win+R`` -> ``control srchadmin.dll`` beírásával megtekinthetsz. Az indexelés időszakosan a háttérben fut, és gyakran észrevehető CPU terhelést okoz ezért ajánlott a keresési indexelést globálisan letiltani a Windows Search szolgáltatás kikapcsolásával, azonban ez korlátozhatja a keresési funkciókat. Másold be CMD-be az alábbi parancsot.

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f
```

## 5.8 Idő, nyelv és régió

- ``Win+I -> Time & Language`` 

  - Konfiguráld a régió és óra beállításokat.

  - Ha kizárólag egy billentyűzet layout-ot tervezel használni akkor töröld ki az összes többit mivel véletlen megnyomhatod a hotkey-t ami átváltja a layout-ot, ami zavaró lehet.

- Állítsd be és szinkronizáld a rendszer óráját.

## 5.9 Böngésző konfigurálása

- Telepítsd fel az általad kedvelt böngészőt. Lásd: [privacytests.org](https://privacytests.org/)

- Ha Firefox-ot szeretnél feltelepíteni használd az alábbi parancsot PowerShell-ben egy minimális telepítésért.

```powershell
C:\bin\install-firefox.ps1
```

<details>
<summary>Mit csinál pontosan a script?</summary>

- Feltelepíti a legfrissebb Firefox verziót

- Letörli a felsorolt fájlokat:

  - ``"crashreporter.exe"``

  - ``"crashreporter.ini"``

  - ``"defaultagent.ini"``

  - ``"defaultagent_localized.ini"``

  - ``"default-browser-agent.exe"``

  - ``"maintenanceservice.exe"``

  - ``"maintenanceservice_installer.exe"``

  - ``"pingsender.exe"``

  - ``"updater.exe"``

  - ``"updater.ini"``

  - ``"update-settings.ini"``
  
- Kikapcsolja a frissítéseket a ``DisableAppUpdate`` policy használatával

- Hozzáadja a ``uBlock Origin``, ``FastForward`` és ``CleanURLs`` kiegészítőket

- Konfigurálja a következőket:

  - ``"datareporting.healthreport.uploadEnabled", false``

  - ``"browser.newtabpage.activity-stream.feeds.section.topstories", false``

  - ``"browser.newtabpage.activity-stream.feeds.topsites", false``

  - ``"dom.security.https_only_mode", true``

  - ``"browser.uidensity`", 1``

  - ``"full-screen-api.transition-duration.enter", "0 0"``

  - ``"full-screen-api.transition-duration.leave", "0 0"``

  - ``"full-screen-api.warning.timeout", 0``

  - ``"nglayout.enable_drag_images", false``

  - ``"reader.parse-on-load.enabled", false``

  - ``"browser.tabs.firefox-view", false``

  - ``"browser.tabs.tabmanager.enabled", false``

  - ``"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false``

  - ``"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false``
  
</details>

--- 

- Kapcsolj ki minden nyomkövetőt.

- Telepítsd/konfiguráld a következő kiegészítőket:

   - uBlock Origin - Állítsd be a filter list-et. Ajánlott mindent bepipálni
   - CleanURLs - Nem szükséges konfiguráció
   - FastForward - A ``Recommended: "XY"`` alapján állítsd be

## 5.10 Ütemezett feladatok kikapcsolása

Az alábbi PowerShell parancs kikapcsolja az ütemezett feladatokat amik rendszeresen futnak a háttérben. Ha nem szeretsz scripteket futtatni vagy csak ellenőrizni szeretnéd hogy mit változtatott a script, használd a [TaskSchedulerView](https://www.nirsoft.net/utils/task_scheduler_view.html) programot.

```powershell
C:\bin\disable-scheduled-tasks.ps1
```
## 5.11 Windows Aktiválása

Ha nem vásároltál Windows kulcsot, használd PowerShell-ben az alábbi parancsot hogy aktiváld:

```powershell
irm https://massgrave.dev/get | iex
```

## 5.12 Egyéb beállítások

CMD-be másold be az alábbi parancsokat.

- Ha használsz jelszót állítsd be hogy soha ne járjon le, ezáltal a Windows nem fogja rendszeresen kérni hogy változtasd meg a jelszavad:

```bat
net accounts /maxpwage:unlimited
```

- Tiltsd le a lefoglalt tárhelyet:

```bat
DISM /Online /Set-ReservedStorageState /State:Disabled
```

- Ha nincs jelen HDD a rendszeren akkor a Superfetch/Prefetch letiltható:

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
```

- Konfiguráld a ``Win+R -> sysdm.cpl -> Advanced -> Performance -> Settings`` menüt. Ez modern rendszereken nem befolyásolja a teljesítményt azonban letisztultabb lesz a Windows.

- Kapcsolj ki mindent a ``System`` -> ``Notifications and actions``-ben a ``Win+I`` megnyomásával.
    
## 5.13 Runtime-ok feltelepítése

- [Visual C++ Redistributable](https://github.com/abbodi1406/vcredist)
- [DirectX](https://www.microsoft.com/en-gb/download/details.aspx?id=8109)
- [.NET 4.8](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48)

## 5.14 Optional Features

``Win+R -> Optional Features`` majd pedig állítsd be úgy ahogy a képen látható.

Windows Serveren az ``OptionalFeatures`` megfelelője a ``Server Manager -> Manage -> Remove Roles and Features``

   - [Példa](/media/features-example.png)

### 5.14.1 NET 3.5

Ha kihagytad az [ISO testreszabása](#43-iso-testreszabása-opcionális) pontot akkor a NET 3.5 nincs bekapcsolva és nem fogod tudni feltelepíteni mivel a Windows Update kivan kapcsolva. Ezért egy külön módszerrel kell telepíteni.

- Tölts le egy Windows ISO-t és csomagold ki. Cseréld ki a ``C:\EXTRACTED_ISO\sources\sxs``-t a megfelelő elérési úttal, majd futtasd a parancsot.

```bat
DISM /Online /Enable-Feature /FeatureName:NetFx3 /LimitAccess /Source:"C:\EXTRACTED_ISO\sources\sxs"
```

## 5.15 Tray Icons

Jobb klikk a tálcára -> ``Taskbar settings -> Select which icons appear on the taskbar`` és kapcsold be az ``Always show all icons in the notifications area`` opciót.
Ez segít a futó folyamatok kezelésében és átláthatóságában. 

## 5.16 Hibernation

A Hibernation-t Windowson belül is ki lehet kapcsolni így a PC egy tiszta Shut Down-t fog végrehajtani a gép leállításakor a szoftverállapot lemezre mentése helyett. CMD-be másold be az alábbi parancsot.

```bat
powercfg /h off
```

## 5.17 Bloatware kezelése

Javasolt a debloat scriptek elkerülése és az olyan komponensek eltávolítása ami nem ténylegesen bloatware, mivel ez az operációs rendszer meghibásodásához vezethet.

- Még nem ajánlott letörölni az Xbox Game Bar-t mivel a későbbi lépésekben problémába ütközhetsz ([Játék regisztrálása Game Bar-ban](#5352-játék-regisztálása-game-bar-ban)).

- [AppxPackagesManager](https://github.com/valleyofdoom/AppxPackagesManager) használatával távolítsd el a nem kívánt programokat.

- Töröld le a OneDrive-ot az alábbi CMD paranccsal.

```bat
for %a in ("SysWOW64" "System32") do (if exist "%windir%\%~a\OneDriveSetup.exe" ("%windir%\%~a\OneDriveSetup.exe" /uninstall)) && reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
```  

- Microsoft Edge letiltása (nem letörlése). A böngészőt letiltani kell nem pedig letörölni a WebView Runtime megtartása érdekében.
        
  - Nyisd meg a Microsoft Edge-et majd pedig a beállításokban kapcsolj ki bármilyen automatikus start-up beállítást mint például:
      
      - ``Settings -> System and performance -> Startup boost``
      - ``Continue running background extensions and apps when Microsoft Edge is closed``

    - Töltsd le az [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)-t és navigálj az ``Everything`` részhez, majd keress rá az ``Edge`` kifejezésre és pipálj ki mindent ami megjelenik.

    - A böngésző frissítése visszaállít néhány beállítást. Használd az alábbi parancsot CMD-ben hogy ez ne forduljon elő. Ha error-t ír, Task Managerben zárj be minden rejtett Microsoft Edge folyamatot.

     ```bat
     rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
     ```

   - Töröld ki az összes Edge-hez tartozó shortcut-ot.

   ```bat
   for /f "delims=" %a in ('where /r C:\ *edge.lnk*') do (del /f /q "%a")
   ```

- A start menüben távolítsd el az alkalmazások parancsikonjait. Fontos megjegyezni, hogy ezek az alkalmazások valójában nincsenek telepítve--csak akkor települnek fel ha rájuk kattintasz.

- ``Win+I -> Apps -> Apps & Features -> Optional Features`` és törölj le mindent kivéve a ``Notepad``-et, ``WordPad``-et és ``Windows Media Player``-t. Windows 11-en a ``WMIC`` is maradjon.

- A ``smartscreen.exe`` figyelmen kívül hagyja a registry key-t ami szabályozza hogy fut-e, ezért át kell nevezni az exe-t hogy ne tudjon elindulni. CMD-be másold be az alábbi parancsokat sorrendben.

```bat
C:\bin\MinSudo.exe --TrustedInstaller --Privileged
```

```bat
taskkill /f /im smartscreen.exe > nul 2>&1 & ren C:\Windows\System32\smartscreen.exe smartscreen.exee
```

- Task Manager-ben ellenőrizd hogy nem-e fut semmilyen bloatware a háttérben.

## 5.18 7-Zip letöltése és beállítása

- [7-Zip](https://www.7-zip.org/a/7z2301-x64.exe)

- Nyisd meg a ``C:\Program Files\7-Zip\7zFM.exe``-t -> ``Tools -> Options`` és add hozzá a 7-Zip-et az összes fájl típushoz a ``+`` gombra kattintva. Lehetséges hogy kétszer kell megnyomnod hogy felülírd a már hozzáadott fájl típusokat. A 7-Zip részleget a letisztultság kedvéért érdemes beállítani: ([1](/media/7-zip-settings-example.png)).

## 5.19 GPU Driver

Lásd [docs/configure-nvidia.md](/docs/configure-nvidia.md)

Lásd [docs/configure-amd.md](/docs/configure-amd.md)

## 5.20 MSI Afterburner

- Töltsd le az [MSI Afterburner](https://www.msi.com/Landing/afterburner/graphics-cards)-t és telepítsd fel.

- Állíts be egy magas, statikus fan speed-et mivel a fan curve funkció működéséhez futnia kell a programnak.

- A beállításokon belül: ``Check for available product updates`` -> ``never``

- Amiután konfiguráltad mentsd el az 1. profilra a beállításokat.

- Hogy a rendszer automatikusan betöltse az 1. profilt és utána bezárja a programot, menj be ``shell:startup``-ba -> jobb klikk -> ``Create a Shortcut`` és másold be a következőt:

  ```bat
  "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" /Profile1 /Q
  ```

## 5.21 Felbontások és Scaling Mode

- Keress egy stabil OC-t a monitorodhoz. NVIDIA Control Panel-ben a ``Change resolution -> Customize -> Create Custom Resolution`` fülnél vidd feljebb a refresh rate-t ~3-asával amíg a monitor nem ír egy ``Out of Range`` üzenetet vagy pedig csak szimplán fekete a képernyő. Ha ez történik, csak várj 15 másodpercet és automatikusan visszaáll az előzőleg használt értékekre. Ezután egyesével vedd visszább a refresh ratet. Például ha 250 hz-ről ugrottál 253 hz-re és fekete volt a képernyő akkor 252-től indulva menj lejjebb amíg stabil nem lesz. Ezután teszteld [itt](https://www.testufo.com/) hogy nincs e screen tearing és hogy a monitor kábelének nincs e úgynevezett [coil whine](https://pcsupport.lenovo.com/ie/en/products/laptops-and-netbooks/solutions/ht511649)-ja.

- Általában két lehetőséged van: Display, vagy GPU scaling. A monitorod natív felbontása nem igényel scalinget ezáltal identity scaling-et ([1](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ne-wingdi-displayconfig_scaling)), ([2](/docs/research.md#2-identity-scaling)) használhatsz. 

- Állíts be egy egész refresh ratet (a legmagasabbat amit az első pontnál eltudtál érni), például 60,00/240,00, nem 59,94/239,76. Ennek elérése érdekében használd az ``Exact`` vagy ``Exact reduced`` timing-ot [CRU](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)-ban mivel a többi egy picit eltérő lehet.

  - 280hz vagy magasabb frekvencia esetén a ``DisplayID 2.0`` extension block-on belül add hozzá a használni kívánt felbontást.

- Töröld az összes nem használt felbontást és egyéb bloatwaret. Az alábbi példa szimplán egy kiinduló pont és lehetséges hogy neked máshogy kell beállítanod.
 
  - [Példa](/media/cru-example.png)  

- Ha NVIDIA GPU-d van, győzödj meg róla hogy a ``Display`` opció a ``Perform scaling on`` beállításnál még mindig elérhető. Ha nem, futtasd a CRU mappájában lévő reset.exe-t hogy visszaállítsd a beállításokat alapra és konfiguráld újra a CRU-t. Minden változtatás után futtasd a restart64.exe-t hogy megtudd mi volt az ami a problémát okozta.

- Ellenőrizd hogy a CRU-ban generált felbontás van-e használatban: ``Win+I:  System ->  Advanced display settings``

## 5.22 Spectre, Meltdown és CPU Microcode

Az újabb platformok és rendszerarchitektúrák esetén előfordulhat teljesítménycsökkenés a kikapcsolásukkal ([1](https://www.phoronix.com/review/amd-zen4-spectrev2)). Éppen ezért fontos benchmarkokat végezni hogy meghatározzuk, hogy a teljesítmény pozitívan, negatívan vagy egyáltalán nem változik. Az állapotuk az [InSpectre](https://www.grc.com/inspectre.htm) programmal, illetve a microcode DLL-ek átnevezésével állítható attól függően, hogy van-e microcode verzió eltérés az operációs rendszer és a BIOS között ([1](https://superuser.com/a/895447), [2](https://support.mozilla.org/en-US/kb/microcode-update)). 

<details>
<summary>Instrukció a DLL-ek átnevezésére</summary>

CMD-be másold be a következő parancsokat:

```bat
C:\bin\MinSudo.exe --TrustedInstaller --Privileged
```

```bat
ren C:\Windows\System32\mcupdate_GenuineIntel.dll mcupdate_GenuineIntel.dlll
```

```bat
ren C:\Windows\System32\mcupdate_AuthenticAMD.dll mcupdate_AuthenticAMD.dlll
```

</details>

A Meltdown nincs hatással az AMD-s rendszerekre ([1](https://www.theverge.com/2018/1/3/16844630/intel-processor-security-flaw-bug-kernel-windows-linux), [2](https://www.phoronix.com/news/x86-PTI-Initial-Gaming-Tests), [3](https://lkml.org/lkml/2018/1/3/425)) és szükséges pár anti-cheat működéséhez (FACEIT).

## 5.23 Power Plan

- Állítsd be a High Performance power plant:

```bat
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
```

- Töröld ki a Balanced power plant:

 ```bat
 powercfg /delete 381b4222-f694-41f0-9685-ff5bb260df2
 ```

- Töröld ki a Power Saving power plant: 

```bat
powercfg /delete a1841308-3541-4fab-bc81-f71556f20b4a
```

- USB 3 Link Power Management - Off:  

```bat
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
```

- USB Selective Suspend - Disabled:

```bat
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
```

- Turn off display after - 0 minutes: 

```bat
powercfg /setacvalueindex scheme_current 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
```

- Processor performance core parking min cores - 100

```bat
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100
```
```bat
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318584 100
```

- Processor performance time check interval - 5000: 

```bat
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000
```

- Végül pedig:

```bat
powercfg /setactive scheme_current
```

## 5.24 Memory Management beállítások

- PowerShell-be másold be az alábbi parancsot hogy megtekintsd a beállításokat:

```powershell
Get-MMAgent
```

- Használd az alábbi példát hogy kikapcsolj egy adott beállítást. Ha a Superfetch/Prefetch-et bekapcsolva hagytad az [Egyéb](#511-egyéb-beállítások) szekcióban akkor nagy valószínűséggel a Prefetch-el kapcsolatos funkciókra szükséged van.

```powershell
Disable-MMAgent -MemoryCompression
```

## 5.25 NIC konfigurálása

- ``Win+R`` -> ``ncpa.cpl``. 

- Tilts le minden nem használt adaptert. Jobb klikk a fő adapterre és ``Properties``

- Kapcsold ki az összes funkciót kivéve a ``QoS Packet Scheduler``-t (Ha a router-ed támogatja és használni tervezed) és az ``Internet Protocol Version 4 (TCP/IPv4)``-et.

- Állíts be egy Statikus IP-t. CMD-be írd be hogy ``ipconfig /all``. Jobb klikk a fő adapteredre, ``Properties``, majd pedig kattints rá az ``Internet Protocol Version 4 (TCP/IPv4)``-re és írd át manuálisan az összes beállítást a CMD-ben kiírtaknak megfelelően. 

  - Lásd: [Recommended DNS Providers | Privacy Guides](https://www.privacyguides.org/en/dns/#recommended-providers)

## 5.26 Audio eszközök beállítása

- ``Win+R : mmsys.cpl``

- Tiltsd le az összes nem használt Playback és Recording eszközt.

- A Communications fülnél állítsd be hogy ``Do nothing``

## 5.27 Process Explorer

Használj Process Explorer-t mivel a stock Task Manager a CPU kihasználtságát %-ban jelzi ami félrevezető lehet [1](https://aaron-margosis.medium.com/task-managers-cpu-numbers-are-all-but-meaningless-2d165b421e43). Ezzel ellentétben a Process Explorer idő-alapú terhelést mutat nem beszélve számos funkcióról ami nem elérhető az alap Task Manager-ben.

- [Töltsd le](https://download.sysinternals.com/files/ProcessExplorer.zip) majd pedig csomagold ki.

- Másold ki a ``procexp64.exe``-t egy biztonságos helyre mint pl. ``C:\Windows`` majd nyisd meg.

- ``Options`` -> ``Replace Task Manager``. Innentől ha megnyitod a Task Manager-t automatikusan a Process Explorer nyílik meg. Opcionálisan állítsd be a továbbiakat:

  - Confirm Kill 

  - Allow Only One Instance
  
  - Always On Top (jól jön ha a játék crashel vagy lefagy)

  - ``View`` -> ``Select Columns`` -> ``Process Performance`` majd pedig pipáld be a ``Context Switch Delta``-t, ``CPU Cycles Delta``-t és a ``Base Priority``-t.


## 5.28 Device Manager beállítása

- ``Win+R`` -> ``devmgmt.msc`` hogy megnyisd a Device Manager-t.

- A ``Disk drives`` kategóriánál jobb klikk az SSD-re -> ``Polciies`` -> és pipáld be a ``Turn off Windows write-cache buffer flushing on the device`` opciót.

- A ``Network adapters`` kategóriánál ``Properties -> Advanced`` és kapcsolj ki minden power saving funkciót.
  
  - Energy-Efficient Ethernet
  - Gigabit Lite
  - Green Ethernet
  - Power Saving Mode

- ``View -> Devices by connection`` és tilts le minden PCIe, SATA, NVMe, XHCI Controllert és USB Hub-ot amihez nincs semmi csatlakoztatva. Tilts le minden nem használt eszközt ami ugyanahhoz a PCIe port-hoz van csatlakoztatva mint a GPU, pl. HD Audio. Ha valamiben nem vagy biztos inkább ne tiltsd le, vagy keress rá az interneten.

- A HID eszközöket is letilthatod azonban lehetséges hogy az adott periféria szoftvere nem fogja felimserni az eszközt. Ha véletlen letiltod az egered, használd a billentyűzeted hogy visszakapcsold az Enter, Tab és nyilak használatával.

- Opcionálisan használd a [DeviceCleanup](https://www.majorgeeks.com/mg/getmirror/device_cleanup_tool,1.html) programot hogy eltávolíts rejtett eszközöket.


## 5.29 Device Power Saving

- Nyisd meg a PowerShell-t és másold be az alábbi parancsot hogy kikapcsold az ``Allow the computer to turn off this device to save power`` opciót a Device Manager-ben minden alkalmaz eszközön.

```powershell
Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }
```

- Ha kihúzod és visszadugod az eszközt akkor ez a beállítás visszaállhat tehát vagy kerüld el vagy futtasd a parancsot minden alkalommal, vagy pedig használd a [DriverPowerSaving](/bin/DriverPowerSaving.ps1) scriptet hogy minden újraindításnál automatikusan fusson csinálj egy shortcut-ot ``shell:startup``-ba és használd a PowerShell paramétert hogy ne notepad-ként fusson. Ez ajánlatos, csak hogy biztosra menj.

## 5.30 Fájl rendszer

CMD-be másold be az alábbi parancsokat.

- Tiltsd le a [8.3-as fájlnevek](https://hu.wikipedia.org/wiki/8.3-as_f%C3%A1jln%C3%A9v) készítését FAT és NTFS formátumú meghajtókon:

```bat
fsutil behavior set disable8dot3 1
```

Tiltsd le a [Last Acces Time Stamp Update](https://www.tenforums.com/tutorials/139015-enable-disable-ntfs-last-access-time-stamp-updates-windows-10-a.html)-et:

```bat
fsutil behavior set disablelastaccess 1
```

## 5.31 Event Trace Sessions

Ezekkel a fájlokkal automatikusan tudsz váltani ETS Enabled és Disabled között aminek a hatását meg tudod nézni itt: ``Win+R -> perfmon -> Data Collector Sets -> Event Trace Session``. Azok a programok amelyek Event Tracing-re támaszkodnak (pl. Event Viewer) nem fognak tudni adatot log-olni amíg kivan kapcsolva. CMD-be másold be az alábbi parancsokat hogy megépítsd a két registry fájlt a ``C:\`` meghajtón. Futtasd az ``ets-disable.reg``-et NSudo-val.

- ets-enable.reg
```bat
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger" "C:\ets-enable.reg"
```
- ets-disable.reg

```bat
>> "C:\ets-disable.reg" echo Windows Registry Editor Version 5.00 && >> "C:\ets-disable.reg" echo. && >> "C:\ets-disable.reg" echo [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger]
```
- Tiltsd le a SleepStudy-t (UserNonPresentSession)

```bat
for %a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%~a/Diagnostic /e:false)
```

## 5.32 Message Signaled Interrupts

- Az MSI-k gyorsabbak mint a hagyományos signal-based interruptok és az IRQ sharing problémát is megoldhatják.

- Töltsd le a [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy)-t.

- Nyisd meg és sorold fel az eszközöket MSI Mode alapján. Kapcsold be az MSI-ket az összes támogatott eszközön. Vedd figyelembe hogy néhány driver fejlesztő alapból kikapcsolva hagyja az MSI-ket, tehát ha újratelepítesz egy drivert utána mindig érdemes ellenőrizni. Kerüld az eszközök újraindítását miután alkalmaztad a policy-ket, helyette indítsd újra a gépet.

- ``Win+R -> msinfo32 -> Hardware Resources -> Conflicts/Sharing`` és győződj meg róla hogy nincs IRQ Sharing a rendszeren.

## 5.33 XHCI Interrupt Moderation (IMOD)

Windows 7-en az IMOD Interval 1ms, viszont az újabb OS-eken 0.05ms (50us) kivéve ha az adott USB drivernél más van megadva. Ez azt jelenti hogy amiután egy Interrupt generálva lett, az XHCI (USB) controller vár (úgynevezett buffer period) hogy több adat érkezzen mielőtt újabb Interruptot generálna. Ez csökkenti a CPU terhelését de adatvesztéshez vezethet.
Példa: egy 1000-es polling rate-ű egér minden 1ms-ban küld adatot. Ha csak az egeret mozgatod egy 1ms-os intervallumban akkor nem történik Interrupt Moderation, mivel az interruptok generálási sebessége kisebb vagy egyenlő a meghatározott intervallummal. Azonban játék közben, ahol egyszerre mozgatod az egeret, nyomod a billentyűzetet stb, könnyen meghaladod az 1000 interrupt/másodpercet. Habár ez kevésbé valószínű 0,05 ms-os IMOD intervallum mellett, akkor is előfordulhat.

- Töltsd le és telepítsd fel az [RWEverything](http://rweverything.com/download/)-et és másold be CMD-be az alábbi parancsot hogy letiltsd a ``Microsoft Vulnerable Driver Blocklist``-et. 

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f
```

- A ``bin`` mappában lévő [XHCI-IMOD-Interval.ps1](/bin/XHCI-IMOD-Interval.ps1) fájlt másold be a ``C:\``-be. Ha az RWEverything-et máshova telepítetted akkor a ps1 fájlban a ``$rwePath = "C:\Program Files\RW-Everything\Rw.exe"`` sort írd át. Csinálj egy shortcut-ot ``shell:startup``-ba hogy minden indításnál fusson.

## 5.34 Applikációk konfigurálása

### 5.34.1 FPS Limit

- Ha limitálod az FPS-t akkor a monitorod refresh rate-jének a többszörése korlátozd le. Bizonyosodj meg róla hogy a GPU nincs teljesen kihasználva mivel minél kevesebb a kihasználtsága annál kevesebb a system latency.

  - Lásd: [How to properly cap your FPS | Calypto](https://youtu.be/_73gFgNrYVQ?si=VeCh5MXDgjHQdJ7h)
  - Lásd: [FPS Cap Calculator | BoringBoredom](https://boringboredom.github.io/tools/fpscapcalculator)

- Ha RTSS-el limitálod az FPS-t sokkal konzisztensebb lesz a frame-pacing mivel busy-wait-et használ ami sokkal precízebb mint a passive-wait de cserébe nagyobb latency-vel és CPU overhead-el jár.

### 5.34.2 Játék regisztrálása Game Bar-ban

Győződj meg róla hogy a Game Bar felismeri a játékot. Nyisd meg a Game Bar-t ``Win+G`` megnyomásával amikor játékban vagy és kapcsold be a ``Remember this is a game`` opciót. 

### 5.34.3 Presentation Mode

Ez nem egy ajánlás hogy melyik Presentation Mode-ot használd, inkább csak informatív okból írom le.

- Lásd: [Presentation Models](https://wiki.special-k.info/en/Presentation_Model)

- [PresentMon](https://github.com/GameTechDev/PresentMon)-al ellenőrizd hogy a kívánt Presentation Mode-ot használod-e.

- Ha ``Hardware: Legacy Flip``-et szeretnél használni, pipáld ki a ``Disable fullscreen optimizations`` négyzetet. Ha nem működik, használd az alábbi parancsokat és indítsd újra a gépet. 

```bat
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
```

```bat
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
```

- Ha ``Hardware Composed: Independent Flip``-en ragadtál és másik presentation mode-ot szeretnél használni másold be CMD-be a következőt:

```bat
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d "5" /f
```

### 5.34.4 Game Mode

A Game Mode megakadályozza a Windows Update futását valamint bizonyos értesítések megjelenítését ([1](https://support.xbox.com/en-GB/help/games-apps/game-setup-and-play/use-game-mode-gaming-on-pc)). Fontos megjegyezni, hogy a Game Mode befolyásolhatja a folyamatok és thread-ek prioritását, attól függően, hogy a PsPrioritySeparation értéke hogyan van beállítva. Érdemes kísérletezni a Game Mode engedélyezésével és letiltásával, hogy meghatározd annak hatását a rendszer teljesítményére.

### 5.34.5 Media lejátszó

- [mpv](https://mpv.io/)
- [VLC](https://www.videolan.org/)
- [mpc-hc](https://github.com/clsid2/mpc-hc)

### 5.34.6 QoS Policy

Abban az esetben ha a routered támogatja a Quality of Service beállítást, akkor [konfigurálható egy QoS Policy](/media/dscp-46-qos-policy.png) hogy egy megadott applikáció csomagjait helyezze előnybe a többi applikációval szemben. Ezt vagy a router oldalán, vagy pedig egy külön [applikációban](https://www.microsoft.com/en-us/download/details.aspx?id=4865) tudod ellenőrizni. [New Capture](/media/network-monitor-new-capture.png), nyisd meg a játékot, amelyre DSCP-értéket állítottál be, és reprodukálj egy olyan helyzetet, amelyben csomagok küldésére és fogadására kerül sor mint pl. egy online meccs. Nyomj egy F5-öt hogy elkezdd a logolást, 30 mp után pedig egy F7-et. A bal oldali ablakban kattints a játék nevére, majd kattints egy packet headerre. Bővítsd a packet info-t a frame details alatt, és végül bővítsd az Ipv4 alkategóriát. Ekkor láthatóvá válik az egyes folyamatok aktuális DSCP-értéke: ``"DifferentiatedServices Field: DSCP: 46, ECN: 0"``.

### 5.34.7 Discord

- Data & Privacy - Use data to improve Discord - OFF

- Voice & Video - Hardware Acceleration - OFF

- Voice & Video - Enable Quality of Service High Packet Priority - OFF

- Advanced - Hardware Acceleration - OFF

- Game Overlay - OFF

- Ha le szeretnéd tiltani az automikus frissítéseket, használd az alábbi parancsot hogy átnevezd az ``Update.exe`` fájlt.

```bat
ren "%LOCALAPPDATA%\Discord\Update.exe" "Update.exee"
```

- Opcionálisan használj [DiscordFixer](https://github.com/HerXayah/Discord-Fixer)-t. 

  - Lásd [docs/research.md/discord-fixer](/docs/research.md#3-discordfixer)

### 5.34.8 Epic Games

- Néhány Epic-es játéknál automatikusan fut az ``EOSOverlayRenderer-Win64-Shipping.exe`` ami általában a ``C:\Program Files (x86)\Epic Games\Launcher\Portal\Extras\Overlay`` directory-ban található. Használd az alábbi parancsot hogy átírd a nevét, abban az esetben ha az Epic Games-t az alapértelmezett helyre telepítetted. Játékbeli vásárlásokhoz (pl. VBucks feltöltés) kötelező futnia. Ebben az esetben csak írd vissza a nevét és indítsd újra a játékot. Fontos megjegyezni hogy az Epic Games frissítése automatikusan újra generálja a fájlt.

```bat
ren "C:\Program Files (x86)\Epic Games\Launcher\Portal\Extras\Overlay\EOSOverlayRenderer-Win64-Shipping.exe" EOSOverlayRenderer-Win64-Shipping.exee
```
- Amiután elindítasz egy játékot, az Epic Games Launcher továbbra is fut a háttérben azonban bezárható a Steam-mel ellentétben.

### 5.34.9 Steam 

- Bal fent ``Steam`` -> ``Settings`` -> ``Interface``, kapcsold ki az ``Enable smooth scrolling in web view`` és az ``Enable GPU Accelerated rendering in web views`` opciót.

- ``Library`` -> kapcsold be a ``Low Bandwith Mode``-ot, ``Low Performance Mode``-ot és a ``Disable Community Content``-et.

Töltsd le a [NoSteamWebHelper](https://github.com/Aetopia/NoSteamWebHelper)-t.

- Másold be az ``umpdc.dll``-t abba a mappába ahol a Steam.exe található.

Így mostantól automatikusan bezáródik a CEF/Chromium Embedded Framework amikor elindítasz egy játékot azonban amikor bezárod újra elindul hogy maga a Steam applikáció elérhető legyen. Vedd figyelembe hogy a Steam overlay nem lesz elérhető játék közben.

## 5.35 Interruptok és DPC-k

A Windows CPU 0-án ütemez számos interruptot és DPC-t ami elég terhelő lehet egyetlen-egy CPU számára. Ezért affinity-ket kell beállítani és elkülöníteni/eloszlatni a drivereket.

- Használd a [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) programot az affinity-k beállítására: Dupla klikk az adott eszközre -> Device Policy -> ``IrqPolicySpecifiedProcessors`` és válaszd ki a használni kívánt CPU-t/kat. Ha több ugyanolyan nevű eszköz van jelen, úgy azonosíthatod, hogy összehasonlítod a ``Location``-t Device Managerben a ``Properties -> General`` résznél a GoInterruptPolicy-ban lévő ``Location Info``-val.

### 5.35.1 GPU és DirectX Graphics Kernel

Használhatod az [AutoGpuAffinity](https://github.com/valleyofdoom/AutoGpuAffinity)-t hogy benchmarkold az összes CPU-t. Ez segíthet eldönteni melyik CPU-n kerüljön feldolgozásra a GPU. Ha nem használsz Hyper-Threading/SMT-t és E-Core-okat akkor szinte azonosan fog teljesíteni az összes CPU.

### 5.35.2 XHCI és Audio controller

Ez a két modul nagy számban generál interruptokat ezért érdemes elkülöníteni a kettőt ha több XHCI controller-ed van vagy pedig alaplapi audio-t használsz.

### 5.35.3 Network Interface Card (NIC)

Támogatnia kell az MSI-X-et ahhoz hogy az ISR azon a CPU-n fusson amelyik végrehajtja a DPC-ket. Figyelj arra hogy az RSS beállítás szabja meg hogy pontosan hány CPU-n van ütemezve a NIC. Például, ha az RSSBaseCpu a CPU 2-re van állítva és 4 RSS Queue-t használsz akkor a 2/3/4/5-ön lesz ütemezve.

  <details> 
  <summary>RSS beállítása</summary>

  - Lásd [Hány RSS Queue-ra van szükséged](/docs/research.md#hány-rss-queue-ra-van-szükséged)
  
  - Navigálj a következő registry key-hez: ``HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000``, használd a te driveredhez tartozó [Driver Key](/media/find-driver-key-example.png)-t.

  - Add hozzá/írd át a következő értékeket (mindegyik ``String``):

    - ``*RSSProfile`` - "4" - különben a többi érték figyelmen kívül maradhat 
    - ``*RSS`` - "1" = Enable RSS - "0" = Disable RSS
    - ``*RSSBaseProcNumber`` - A te általad használni kívánt base CPU
    - ``*NumRssQueues`` - RSS Queue-k száma
    - ``*MaxRssProcessors`` - Állítsd ugyanarra mint a ``*NumRssQueues`` (Csak Intel NIC)

 - Állítsd be GoInterruptPolicy-ban az MSI Limit-et ugyanannyira vagy többre mint a ``*NumRssQueues``. 

 - Intel NIC-eken állítsd a policy-t ``IrqPolicySpreadMessagesAcrossAllProcessors``-ra, Realtek-en pedig ``IrqPolicySpecifiedProcessors``-ra, majd állíts be egy olyan affinity-t amely megfelel a registry-ben konfigurált beállításoknak (pl. ha ``*RSSBaseProcNumber`` "4", és a ``*NumRssQueues`` "2", akkor válaszd ki az 4, 5 CPU-t).

 >
 > Néhány Realtek NIC-en nem funkcionál megfelelően az RSS hogyha több mint 1 RSS Queue van beállítva. A Hyperthreading/SMT kikapcsolása vagy különbőző MSI Limit-ek beállítása megoldhatja ezt a problémát.

</details>

Amiután kész vagy az előbbi lépésekkel töltsd le az [XTW](https://github.com/valleyofdoom/xtw)-t hogy megfigyeld helyesen működnek e az affinity policy-k.

  - Ellenőrizd hogy egy ISR-hez tartozó DPC ugyanazon a CPU-n kerül-e feldolgozásra. ([példa](/media/isr-dpc-same-core.png))

## 5.36 Event Viewer ellenőrzése

Ez a lépés nem kötelező, azonban segíthet a megmagyarázhatatlan FPS drop-ok és többi probléma azonosításában.

  - NSudo-val futtasd az ``ets-enable.reg`` fájlt mivel ez szükséges az event log működéséhez, majd indítsd újra a gépet.
  
Pár perc használat után ellenőrizd nincs-e teli hibaüzenettel az Event Viewer, majd futtasd az ``ets-disable.reg`` fájlt.

## 5.37 CPU Idle States

Ez kényszeríti a C-State 0-t. Érdemes játék előtt kikapcsolni, majd játék után bekapcsolni az idle statet, mivel az magasabb hőfokokkal (A CPU hőmérsékletének nem lenne szabad elérni a thermal throttling pontot, mivel a hűtéssel már foglalkoztál a [hűtés](#12-hűtés) részlegnél) és energiafogyasztással jár. Kerüld az idle kikapcsolását ha a Hyper-Threading/Simultaneous Multithreading bevan kapcsolva, vagy pedig ha valamilyenféle dynamic boosting feature-t használsz, mint például AMD-n a PBO, Turbo Boost vagy hasonló. 

   - [Idle Enable](/bin/enable_idle.bat)
   - [Idle Disable](/bin/disable_idle.bat)

## 5.38 Paging File

Legtöbb esetben ajánlott bekapcsolva hagyni, ami az alap beállítás. Van egy érv, hogy jobb ha kikapcsolod abban az esetben ha elég RAM-mal rendelkezel a játékhoz mivel csökkenti az I/O overheadet és a RAM gyorsabb mint a disk, azonban FPS drop-okat eredményezhet akkor is ha a memória kihasználtsága közel sem éri el a 100%-ot.

  - Hogy kikapcsold:

    - ``Win+R -> sysdm.cpl -> Advanced`` -> A ``Performance`` szekciónál ``Settings`` -> ``Advanced`` -> A ``Virtual Memory`` alatt ``Change`` -> Pipáld ki az ``Automatically manage paging file size for all drives`` opciót -> Válaszd ki a ``No paging file``-t -> ``Set``


## 5.39 Cleanup és karbantartás

- Használj programokat mint a [BulkCrapUninstaller](https://github.com/Klocman/Bulk-Crap-Uninstaller) mivel a control panel-ban történő uninstall során sok fájl letörlése kimaradhat.

- Használj [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)-t hogy letiltsd a nem kívánt programok/szolgáltatások automatikus futtatását. Ellenőrizd gyakran, főleg egy program feltelepítése után. Töröld ki az összes sárgával jelölt elemet. Lehet hogy ``C:\bin\NSudoLG.exe``-n keresztül kell futtatnod az Autoruns-t az ``Enable All Priviliges`` bepipálásával.

- Disk Cleanup

  - CMD-be másold be az alábbi parancsot, pipálj be mindent kivéve a ``DirectX Shader Cache``-t és ``OK``.

    ```bat
    cleanmgr /sageset:0
    ```  

  - Futtasd magát a cleanup-ot

    ```bat
    cleanmgr /sagerun:0
    ```

- Helyek ahol érdemes ellenőrizni a nem kívánt fájlokat

  - ``C:\``
  - ``C:\Windows\Prefetch`` - prefetch fájlok (ennek a mappának üresnek kell lennie ha a superfetch kivan kapcsolva)
  - ``C:\Windows\SoftwareDistribution`` - Windows Update cache
  - ``C:\Windows\Temp``- ideiglenes fájlok
  - ``%userprofile%``
  - ``%userprofile%\AppData\Local\Temp`` - ideiglenes fájlok
  - Felhasználói directory-k (Downloads, Documents, stb.)

- CMD-be másold be az alábbi parancsot hogy tisztítsd a WinSxS mappát. Ez egy hosszabb folyamat lehet.

  ```bat
  DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
  ```

- Töröld ki a System Restore Point-okat: ``Win+R -> sysdm.cpl``. Ajánlott teljesen kikapcsolni mivel megbízhatatlan.

