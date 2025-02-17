# PC-Tuning 
 
---

## Tartalomjegyzék

- [0. Benchmarkolás](#0-benchmarkolás)
- [1. Physical Setup](#1-physical-setup)
  - [1.1 General](#11-general)
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
  - [2.6 Hyperthreading/SMT](#26-hyperthreadingsmt)
  - [2.7 Power States](#27-power-states)
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
- [4. Pre Install](#4-pre-install)
  - [4.1 Windows verzió kiválasztása](#41-milyen-windows-verziót-használj)
  - [4.2 Szükséges programok letöltése](#42-szükséges-programok-letöltése)
  - [4.3 Stock ISO letöltése](#43-stock-iso-letöltése)
  - [4.4 Build Environment előkészítése](#44-build-environment-előkészítése)
  - [4.5 Nem használt verziók eltávolítása](#45-nem-használt-verziók-eltávolítása)
  - [4.6 Mountold az ISO-t](#46-mountold-az-iso-t)
  - [4.7 NET 3.5 bekapcsolása](#47-net-35-bekapcsolása)
  - [4.8 Szükséges fájlok integrálása](#48-szükséges-fájlok-integrálása)
  - [4.9 Unmount és Commit](#49-unmount-és-commit)
  - [4.10 ISO Compression](#410-iso-compression)
  - [4.11 Átkonvertálás ISO-vá](#4-11-átkonvertálás-iso-vá)
  - [4.12 Telepítés Ventoy használatával](#412-telepítés-ventoy-használatával)
  - [4.13 ISO-ba való bootolás](#413-iso-ba-való-bootolás)
- [5. Post Install](#5-post-install)
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
  - [5.11 Egyéb beállítások](#511-egyéb-beállítások)
  - [5.12 Runtime-ok feltelepítése](#512-runtime-ok-feltelepítése)
  - [5.13 Optional Features](#513-optional-features)
  - [5.14 Tray Icons](#514-tray-icons)
  - [5.15 Hibernation](#515-hibernation)
  - [5.16 Bloatware kezelése](#516-bloatware-kezelése)
  - [5.17 7-Zip](#517-7-zip-letöltése-és-beállítása)
  - [5.18 GPU Driver](#518-gpu-driver)
  - [5.19 MSI Afterburner](#519-msi-afterburner)
  - [5.20 Felbontások és Scaling Mode](#520-felbontások-és-scaling-mode)
  - [5.21 Open-Shell](#521-open-shell)
  - [5.22 Spectre, Meltdown és CPU Microcode](#522-spectre-meltdown-és-cpu-microcode)
  - [5.23 Power Plan](#523-power-plan)
  - [5.24 Memory Management beállítások](#524-memory-management-beállítások)
  - [5.25 BCD Store](#525-bcd-store)
  - [5.26 NIC konfigurálása](#526-nic-konfigurálása)
  - [5.27 Audio eszközök beállítása](#527-audio-eszközök-beállítása)
  - [5.28 Process Explorer](#528-process-explorer)
  - [5.29 Szolgáltatások és driverek](#529-szolgáltatások-és-driverek)
  - [5.30 Device Manager beállítása](#530-device-manager-beállítása)
  - [5.31 Device Power Saving](#531-device-power-saving)
  - [5.32 Fájl rendszer](#532-fájl-rendszer)
  - [5.33 Event Trace Session](#533-event-trace-sessions-ets)
  - [5.34 Message Signaled Interrupts](#534-message-signaled-interrupts)
  - [5.35 XHCI Interrupt Moderation](#535-xhci-interrupt-moderation-imod)
  - [5.36 Applikációk konfigurálása](#536-applikációk-konfigurálása)
    - [5.36.1 FPS Limit](#5361-fps-limit)
    - [5.36.2 Játék regisztrálása Game Bar-ban](#5362-játék-regisztálása-game-bar-ban)
    - [5.36.3 Presentation Mode](#5363-presentation-mode)
    - [5.36.4 Game Mode](#5364-game-mode)
    - [5.36.5 Média lejátszó](#5365-media-lejátszó)
    - [5.36.6 QoS Policy](#5366-qos-policy)
    - [5.36.7 Discord](#5367-discord)
    - [5.36.8 Epic Games](#5368-epic-games)
    - [5.36.9 Steam](#5369-steam)
  - [5.37 Interruptok és DPC-k](#537-interruptok-és-dpc-k)
    - [5.37.1 GPU és DirectX Graphics Kernel](#5371-gpu-és-directx-graphics-kernel)
    - [5.37.2 XHCI és Audio Controller](#5372-xhci-és-audio-controller)
    - [5.37.3 Network Interface Card](#5373-network-interface-card-nic)   
  - [5.38 Event Viewer ellenőrzése](#538-event-viewer-ellenőrzése)
  - [5.39 CPU Idle States](#538-cpu-idle-states)
  - [5.40 Timer Resolution](#540-timer-resolution)  
    - [5.40.1 Maga a Timer Resolution beállítása](#5401-maga-a-timer-resolution-beállítása)
  - [5.41 Paging File](#541-paging-file)
  - [5.42 Cleanup és karbantartás](#542-cleanup-és-karbantartás)

## Bemutató

Ezen útmutató célja a Windows-alapú rendszerek finomhangolása, beleértve a hardver-, operációs rendszer- és szoftverkonfigurációkat. Az útmutatás széleskörű célok elérésére van kialakítva, beleértve a biztonság javítása, azonban általában a competitive játékokban való előny megszerzésére és valós idejű feladatok futtatására van kihegyezve. Hangsúlyt fektet arra hogy a felhasználók saját maguk végezzék el a beállításokat és minimalizálják a scriptek használatát annak érdekében hogy átláthatóbb legyen és kerüljék a nem kívánt módosításokat. A szekciókat sorrendben kell követni mivel az egyes lépések a korábbi lépések befejezésétől függnek, ezért minden szekció számozott.

> [!CAUTION]
Hardver > BIOS > Operációs rendszer

> [!CAUTION]
**NE** alkalmazz random, ismeretlen vagy nem dokumentált beállítást, programot vagy scriptet anélkül hogy megértenéd az adott beállítás hatását a biztonságra, adatvédelemre és a teljesítményre.

# 0. Benchmarkolás

- [FrameView](https://www.nvidia.com/en-gb/geforce/technologies/frameview/) - [PC Latency](https://images.nvidia.com/content/images/article/system-latency-optimization-guide/nvidia-latency-optimization-guide-pc-latency.png)
- [Frame Latency Meter](https://github.com/GPUOpen-Tools/frame_latency_meter)
- [PresentMon](https://github.com/BoringBoredom/Frame-Time-Analysis/raw/main/presentmon/presentmon.zip) - Lásd a teljes listát [itt](https://github.com/GameTechDev/PresentMon/blob/main/README-CaptureApplication.md#metric-definitions)
- [Windows Performance Toolkit](https://learn.microsoft.com/en-us/windows-hardware/test/wpt/) - ISR/DPC végrehajtási idők ellenőrzése [xperf](/bin/xperf-dpcisr.bat)-el
- [Mouse Tester](https://github.com/valleyofdoom/MouseTester) - Egér teljesítményének mérése (pl. polling interval)
- [NVIDIA Reflex Analyzer](https://www.nvidia.com/en-gb/geforce/news/reflex-latency-analyzer-360hz-g-sync-monitors/) - End-to-end latency
- [Frame-Time-Analysis](https://boringboredom.github.io/Frame-Time-Analysis/) - CSV adatok elemzése amit a fenti programok log-oltak

---


# 1. Physical Setup

## 1.1 General

- Lehetőleg minden nagyobb alkatrészcsere után telepítsd újra a Windowst (pl alaplap, cpu, stb). Videókártya az egyik kivétel.

- Kerüld a csavarok túlfeszítését.

- Győződj meg róla hogy a kábelek rendesen bevannak dugva és nem lazák (pl. táp kábelek)

- Érdemes vezetékes eszközöket használni, mivel a vezetéknélküli eszközök hajlamosak aggresszív energiatakarékosságot alkalmazni a hosszabb akkumulátor élettartam érdekében, a túlzott EMI hátrányaival együtt.

- A [CrystalDiskInfo](https://crystalmark.info/en/software/crystaldiskinfo/) és [CrystalDiskMark](https://crystalmark.info/en/software/crystaldiskmark/) programmal megtekinthető az SSD állapota. Új SSD vásárlásakor ellenőrizd a teljes olvasás/írás értékét hogy megállapítsd, nem e használt.

- Frissítsd az SSD, NIC (Network Interface Controller), és a többi periféria firmware-ét.

- Az alaplap kézikönyvében leírtak alapján szereld be a RAM modulokat a megfelőle foglalatokba. Legtöbb esetben dual-channel használata biztosítja a legjobb teljesítményt.

- Használj PCIe portokat amelyek egyenesen a CPU-ba mennek a PCH helyett. Ez jellemzően az M.2 és NVME SSD-kre és a GPU-ra vonatkozik. [HWiNFO](https://www.hwinfo.com/)-ban a PCIe Bus kategóriánál, vagy az alaplapod oldalán lévő manual-ban a PCI részlegnél találod meg a kellő információt.

- Győződj meg róla, hogy a PCIe Bus kategóriába tartozó PCIe eszközök sebessége megegyezik a maximálisan támogatott értékkel, mint például ``x16 3.0``.

  - [Példa](/media/hwinfo-pcie-width-speed.png)

- A nem P-State 0-ra korlátozott GPU-k esetében a kapcsolat sebessége csökkenhet miközben nincs terhelve. 
  
  - Ellenőrizd a [GPU-Z](https://www.techpowerup.com/gpuz/) programban a beépített renderelési teszt segítségével.

- Ha egynél több beépített NIC-ed van, érdemes azt használni amelyik támogatja az MSI-X-et, mivel ez szükséges az RSS ([Receive-Side-Scaling](https://learn.microsoft.com/en-us/windows-hardware/drivers/network/introduction-to-receive-side-scaling)) helyes működéséhez. Ezt a 
[GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) programban ellenőrizni tudod.

- Ragaszd le a laza kábelek végét, hogy csökkentsd az alkatrészek zárlatának kockázatát.

- Kerüld a feleslegesen hosszú kábelek használatát.

- Gyakran érdemes tisztítani az alkatrészeket és a hűtőbordákat, mivel ha porosak, csökkentik a légáramlást és zárlatot okozhatnak.

- Győzödj meg róla, hogy nincsen IRQ Sharing a rendszeren. Ellenőrizni tudod: ``Win+R`` -> ``msinfo32``, rányomsz a ``Hardware Resources``-re, majd a ``Conflicts/Sharing``-re. A ``Memory Address``-t  és az ``I/O Port``-ot figyelm kívül hagyhatod.

- Használj GPU támasztót (GPU Bracket) hogy elkerüld a PCIe slot sérülését.

- Kerüld a daisy chaining-et 
  - Lásd [Installation Remark for High Power Consumption Graphics Cards | Seasonic](https://knowledge.seasonic.com/article/8-installation-remark-for-high-power-consumption-graphics-cards)

## 1.2 Hűtés

- Semmiképp se legyen a gép szőnyegen, vagy olyan helyen ahol nincs elegendő légáramlás. Ha mégis arra kerülne a sor, hogy szőnyegre teszed, akkor egy fa lapot tegyél a gépház alá, így hűvösebb felületen lesz, és kevésbé fog porosodni.

- Érdemes a gépházad oldalát levenni a légáramlás segítése érdekében.

- Használj magas minőségű hővezető pasztát és megfelelő mennyiséget.
  - Lásd [Best Thermal Paste for CPUs | Tom’s Hardware](https://www.tomshardware.com/best-picks/best-thermal-paste)

- Ha heatsink nélküli NVME/M.2 SSD-t szerelsz be ügyelj arra hogy az alaplapon lévő thermal pad-ekről leveszed a fóliát.

- Használj nem RGB-s ventilátorokat magas statikus nyomással.

  - Lásd [PC Fans | Calypto](https://docs.google.com/spreadsheets/d/1AydYHI_M6ov9a3OgVuYXhLEGps0J55LniH9htAHy2wU)

- A ventilátorok alaplapi csatlakoztatásánál fontos figyelembe venni a ventilátorcsatlakozó (fan header) terhelhetőségét, különösen ventilátor-elosztók (splitterek) használata esetén.
  
  - Az alaplapi ventilátorcsatlakozók általában 1A (12W) körüli áramerősséget bírnak, de ez alaplaponként eltérhet. Ha túl sok ventilátort csatlakoztatsz egyetlen headerre egy splitterrel, az túlterhelheti az áramkört, és akár meghibásodást is okozhat. Az RGB-s ventilátorok vagy egyes nagy teljesítményű ventilátorok még ennél is több áramot igényelhetnek.

- Pasztázd újra a GPU-t.


## 1.3 Perifériák konfigurálása

- A legtöbb modern periféria támogatja az onboard memory profilet. Állítsd be őket mielőtt újratelepítenéd a windowst, hogy ne kelljen a későbbi módosítások érdekében feltelepíteni a sok bloatware-t. Több infó a bloatware és a valós idejű applikáció elkülőnítéséről [dual-boot](https://en.wikipedia.org/wiki/Multi-booting) használatával a következő szekcióban.

- Magasabb DPI csökkenti a latency-t. Használj minimum 3200 dpi-t. Ügyelj arra hogy sensor smoothing ne lépjen életbe magasabb DPI használatakor. A windowsban az egér beállítások közt lejjebb viheted a pointer speedet tetszésed szerint ha a játék raw inputot használ.

- Magasabb polling rate csökkenti a jittert. Az 1000Hz-nél magasabb polling rate hardvertől függően negatívan befolyásolhatja a teljesítményt, ezért ennek megfelőlen kell beállítani. Ez nem akkora probléma a 2023 májusi Windows 11 Raw Input Stack update után ami limitálja a nem előtérben lévő programok polling frekvenciáját 125hz-re.

- Az USB kimenet ~7A-ra van korlátozva, és az RGB felesleges energiát igényel. Fontold meg az RGB kikapcsolását, mivel az effektek/animációk nagy terhet tesznek az MCU-ra, és késleltethetik a többi folyamatot. [OpenRGB](https://openrgb.org/) egy jó választás az RGB módosítására.

- Sűrített levegő segítségével tisztítsd az egér szenzorát.

## 1.4 EMI minimalizálása

"EMI", azaz "Elektromágneses interferencia" olyan zavaró jeleket vagy zajt jelent, amelyeket elektromágneses mezők okoznak. Ezek a zavarok általában más elektronikai eszközökből vagy külső forrásokból származnak, és befolyásolhatják az elektronikai berendezések működését. Az EMI problémák gyakran akkor merülnek fel, amikor az elektronikai berendezések közel vannak egymáshoz vagy erős elektromágneses mezők vannak jelen, pl. nagyfeszültségű vezetékek, modemek, vagy vezeték nélküli eszközök.

- Az ilyen "problémás" eszközöket, például mobiltelefonokat (airplane mode is egy megoldás), routereket stb. tedd messzebb a setuptól.

- Gondoskodj arról, hogy a kábelek között mérsékelt távolság legyen a "coupling" kockázatának csökkentése érdekében. Ez akkor fordul elő amikor két vagy több kábel túl közel van egymáshoz, és az elektromos jelek áttérnek az egyik vezetékről a másikra, ami interferenciához vezet.

- Használd vezetékesen a perifériáid.

- Húzd ki az alaplapból a felesleges eszközöket, perifériákat, mint például LED-ek, RGB, előlapi csatlakozók, nem használt HDD-k.

- Ethernet kábel vásárlásnál ajánlatos "shielded", vagy "árnyékolt" kábelt venni mivel ezek olyan kialakítással rendelkeznek ami segít kizárni a zavaró jeleket, amelyek befolyásholhatják a hálózati adatvitelt.

## 1.5 USB portok elrendezésének konfigurálása

Használd a kívánt XHCI-controller első néhány portját. Előfordulhat, hogy némelyikük fizikailag nem megállapítható, amit az [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) programban megnézhetsz.

  - A Ryzen-es rendszerek rendelkeznek egy XHCI-vezérlővel, amely közvetlenül a CPU-hoz csatlakozik. Ez [HWiNFO](https://www.hwinfo.com/)-ban a ``PCIe Bus`` kategóriában azonosítható. 

     - [Példa](/media/ryzen-xhci-controller.png)      

Ha egynél több XHCI-controller-ed van, akkor az olyan eszközöket, mint például az egér, billentyűzet, és fejhallgató, egy másik controller-re különítheted el, hogy azok ne zavarják a polling konzisztenciáját.

---

# 2. BIOS

> [!CAUTION] 
Fontos, hogy a módosított beállítások valóban pozítívan befolyásolják a teljesítményt és jegyezd fel őket valahova hogy a jövőben könnyebben megoldj egy felmerülő problémát. Mielőtt belekezdesz ajánlott hogy állítsd alaphelyzetbe a BIOS-t hogy tiszta lappal indulj ha esetleg valami rosszul volt beállítva.

>[!CAUTION]
Szintén fontos hogy a BIOS módosítása mindig kockázattal jár, ezért körültekintően folytasd.

## 2.1 BIOS frissítések

Ellenőrizd hogy van e frissebb BIOS és hogy van e pozitív változás, mint például stabilabb memória, azonban figyelj oda a fórumokon felvetett problémákra az adott BIOS verzióval kapcsolatban.

## 2.2 CPU Microcode az UEFI-ben

Frissítés útán győződj meg róla, hogy a Spectre, Meltdown és CPU Microcode státusza rendben van magán az operációs rendszeren. Ha problémába ütköznél akkor lehet, hogy BIOS szinten kell visszaállítanod a CPU Microcode-ot.

## 2.3 BIOS Reset

Ha a CMOS reset nem állítja teljes mértékben vissza alaphelyzetbe a BIOS-t, használd az USB Flashback funkciót.

## 2.4 Resizable BAR

``Above 4G Encoding`` engedélyezése szükséges a működéséhez

Csak RTX 3000 és annál újabb GPU-kon támogatott.

Ellenőrizd a Resizable BAR státuszát [GPU-Z](https://www.techpowerup.com/gpuz)-ben.

## 2.5 Rejtett beállítások elérése

Számos alaplap gyártó elrejt sok hasznos beállítást. 

  - A legegyszerűbb megoldás erre az hogy az UEFI-ben lévő összes látható beállítást konfigurálod majd pedig [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-ben a maradék rejtett beállítással folytatod.

## 2.6 Hyperthreading/SMT

Kapcsold ki a [Hyper-Threading/Simultaneous Multithreading](https://en.wikipedia.org/wiki/Hyper-threading) funkciót. Ez például renderelés esetén hasznos lehet de mivel a CPU-nkénti több végrehajtó thread használtata növeli a processzor erőforrásainak igénybevételét, jóval nagyobb hőfokokkal és a rendszer nagyobb latencyjének, és jitterének potenciális forrása. Ha elegendő CPU-val rendelkezel a játék futtatásához, mindenféleképpen kapcsold ki. Ez a koncepció alkalmazható az Intel E-coreok esetében is.

## 2.7 Power States

- Kapcsold ki a C-States-eket. Keresd a *C1E*, *C6* kifejezéseket. S-States (*S3*, *S6*, *Hibernation*).
  
  - Ellenőrizd a C-State residency-t [HWiNFO](https://www.hwinfo.com/)-ban
  
  - Ellenőrizd az S-States-eket ``powercfg /a``-val 

- Kapcsold ki az összes Power Saving funkciót, mint például: *ASPM* (Active State Power Management), ALPM (Aggressive Link Power Managemenet), DRAM Power Down, Hibernation, Clock Gating. Keresd a "power management", "power saving" kifejezéseket.  

## 2.8 Virtualization
Kapcsold ki a Virtualization/SVM Mode, Intel VT-d/AMD-Vi beállításokat, mivel ezek a memória hozzáférés késeltetését növelhetik. A Virtualization szintén hatással lehet a BCLK-ra.
   
  - Ellenőrizd a Virtualization-t Task Manager-ben.

## 2.9 Nem használt eszközök letiltása

Kapcsold ki az összes nem használt eszközt, mint például nem használt NIC-ek, Bluetooth, WiFi, High Definition Audio (ha nem használsz alaplap audio-t), iGPU, SATA és RAM slotok.

## 2.10 Trusted Platform Module

Kapcsold ki a Trusted Platform Module-t (TPM), mert előfordulhat, hogy a rendszer System Management Mode-ba (SMM) kerül a System Management Interruptok (SMI) [1](https://www.youtube.com/watch?v=X72LgcMpM9k&t=2060s) miatt. Ezek olyan nagy prioritású, leállíthatatlan hardveres megszakítások, amelyek azonnal felfüggesztik a CPU összes többi tevékenységét. 

  - Windows 11-en néhány anti-cheat (Vanguard, FACEIT) működéséhez bekapcsolva kell hagyni.

  - Ellenőrizd a TPM állapotát : ``Win+R`` -> ``msinfo32``

## 2.11 Secure Boot

Kapcsold ki a Secure Boot-ot. (Windows 11-en, a Vanguard, FACEIT, igényli a bekapcsolva hagyását.)

  - ``Win+R`` -> ``msinfo32``-ben tudod ellenőrizni az állapotát.

## 2.12 Fast Startup, Standby és Hibernate

Ez leginkább személyes preferencia, tapasztalat és nézőpont kérdése. Vannak, akik nem használják a Fast Startup-ot, Standby-t vagy Hibernation-t, mert ezek néha váratlan problémákat okozhatnak ([magyarázat](https://www.youtube.com/watch?v=OBGxt8zhbRk)). Ehelyett inkább tiszta rendszerindítást részesítenek előnyben, így nem mentik és állítják vissza a kernel és a szoftverek állapotát és korlátozzák a rendszer energiaállapotait S0-ra (működő állapot) és S5-re (alvó állapot).
A rendszer energiaállapotairól [itt](https://learn.microsoft.com/en-us/windows/win32/power/system-power-states) tudhatsz meg többet. A BIOS-ban ezek az opciók gyakran Fast Startup, Suspend to RAM, S-States (S1, S2, S3, S4, S5), Standby, Memory Fast Boot, Hibernation vagy hasonló néven szerepelnek. Az aktuális S-State állapotokat a következő parancssorral ellenőrizheted: ``CMD``-> ``powercfg /a``

A Windows-on belül is kikapcsolható a Fast Startup és Hibernation funckió ami letörli a ``C:\hiberfil.sys`` fájlt

```cmd
powercfg /h off
```
## 2.13 Spread Spectrum

Kapcsold ki a Spread Spectrumot és győződj meg róla hogy a BCLK frequency kereken 100.000 és nem Auto. [HWiNFO](https://www.hwinfo.com/)/[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)-ben ellenőrizni tudod.

## 2.14 PCIe Link Speeds

PCIe Link Speed-et tedd a lehető legmagasabbra, mint például Gen 3, stb. Sose hagyd Auto-n.
  
  - Keresd a ``PCIe Speed``, ``Gen3`` kifejezéseket hogy megtaláld az adott beállítást [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-ben.

## 2.15 Statikus CPU frekvencia

Ha statikus frekvenciát/feszültséget konfigurálsz a CPU-hoz, kapcsold ki a dynamic frequency funkciókat mint például a Speed shift, speedstep, és állítsd az AVX offsetet 0-ra, vagy tedd ``Disabled``-re. Precision Boost Overdrive (PBO) a Ryzen CPU-k esetében a statikus frekvencia és feszültésg alternatívája (X3D kivétel).

  - Egyes esetekben a fent említett beállítások megakadályozhatják, hogy a processzor a BIOS-ban történő manuális beállítás ellenére is túllépje az alapfrekvenciát. Ennek megfelelően állítsd be, ha ez előfordul, és [HWiNFO](https://www.hwinfo.com/)-ban ellnőrizd az órajeleket.

## 2.16 Ventilátor RPM

Konfiguráld a fan speedeket. állíts be egy [fan curve](https://imgur.com/a/ultimate-fan-speed-curve-by-kgtc-iteration-1-fr-en-de-ru-ar-es-hu-kr-sw-etc-https-translate-google-com-2UDYXp0)-öt vagy egy statikus, magas RPM-et.

## 2.17 HPET

Kapcsold be a High Precision Event Timer-t. 
  
  - Újabb AMD rendszereken nincs hatása ennek a beállításnak.

## 2.18 Software telepítési beállítások

Ha automatikus software telepítéssel kapcsolatos beállítást találsz (pl. ASUS Armoury Crate, MSI Utility) kapcsold ki


## 2.19 Legacy USB Support

Kapcsold ki a Legacy USB Support-ot. Lehetséges hogy be kell kapcsolnod hogy új operációs rendszert telepíts fel vagy hogy hozzáférj a BIOS-hoz.

## 2.20 XHCI Hand-off

Kapcsold ki az XHCI Hand-off-ot.

## 2.21 Execute Disable Bit/NX Mode

Kapcsold ki az Execute Disable Bit/NX Mode-ot. Néhány applikáció (FACEIT, Valorant) igényli a bekapcsolva hagyását.

## 2.22 BIOS Profilok és Backup

Mentsd le a jelenlegi BIOS profilodat hogyha valamilyen oknál fogva alaphelyzetbe kell állítani akkor ne kelljen előről kezdened az egészet. A legtöbb alaplapon egy mentett profil betöltése CMOS reset után nem mindig fogja az összes beállítást visszaállítani úgy ahogy volt. Ezért ajánlatos [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-el exportálni a jelenlegi profilod majd reset után újra exportálni és összehasonlítani a két NVRAM fájlt [Notepad++ Compare Plugin](https://sourceforge.net/projects/npp-compare/)-al vagy [Visual Studio Code](https://code.visualstudio.com/download)-al.

---

# 3. Stabilitás, hangolás és hőfokok

## 3.1 Ideiglenes OS

Ajánlott egy ideiglenes OS-t feltelepíteni amin OC-zol és stressz tesztelsz hogy elkerüld a fő OS-ed meghibásodását. RAM stressz teszt esetén így még több RAM-ot tudsz tesztelni mivel a háttérben futó programok nem használnak felesleges memóriát. A safe mode minimális tesztelési környezetként is szolgálhat de előfordulhat hogy bizonyos szoftverek nem fognak működni.

## 3.2 Általános infó

- Szoftveren belül ellenőrizd a változtatásokat a váratlan eredmények elkerülése érdekében (pl. frekvencia, feszültség, timing-ok)

- Overclock-olás közben minden változtatás előtt mentsd el a BIOS profilod, hogy ne kelljen előről kezdeni ha esetleg reset-elni kell a CMOS-t. Lásd [BIOS Profilok és backup](#222-bios-profilok-és-backup)

- Egyetlen-egy erorr vagy crash is túl sok. Figyeld a WHEA-kat a [HWiNFO](https://www.hwinfo.com/) hibaszámlálójával vagy konfigurálj egy Event Viewer filter-t.

- Figyeld a feszültségeket az esetleges overvolting elkerülése érdekében.

- Számtalan tényező járul hozzá a stabilitáshoz, mint például a hőmérséklet, az energiaellátás, a hardver minősége és még sok más.

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

- Konfiguráld a RAM frekvenciát és timing-okat manuálisan jelentős teljesítménybeli javulásért. [(1)](https://kingfaris.co.uk/blog/intel-ram-oc-impact). Az XMP nem hangol be nagyon sok timing-ot és nem is garantál stabilitást.

   - Lásd [Eden’s DDR4 guide](https://web.archive.org/web/20231211232729/https://cdn.discordapp.com/attachments/328891236918493184/1172922515962724444/DDR4_Guide_V1.2.1.pdf)
   - Lásd [KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT](https://github.com/KoTbelowall/INTEL-DDR4-RAM-OC-GUIDE-by-KoT)
   - Lásd [integralfx/MemTestHelper](https://github.com/integralfx/MemTestHelper/blob/oc-guide/DDR4%20OC%20Guide.md)

## 3.7 Stressz-tesztelő eszközök

- StresKit (bootolható)

- Linpack

  - [StresKit](https://github.com/valleyofdoom/StresKit) Linpack-je
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

# 4. Pre-Install

## 4.1 Milyen Windows verziót használj?

- A Windows régebbi verzióiból hiányzik az anti-cheat támogatás, driver támogatás (legfőképp GPU, NIC) és alkalmazások támogatása. Lásd az alábbi táblázatot.

    |GPU|Minimum Windows Verzió|
    |---|---|
    |NVIDIA 10-es és régebbi szériák|Majdnem az összes Windows verzió támogatja|
    |NVIDIA 16, 20-as széria|Win7, Win8, Win10 1709+|
    |NVIDIA 30-as széria|Win7, Win10 1803+|
    |NVIDIA 40 series|Win10 1803+|
    |AMD|Lásd a driver oldalát|

- Windows Server nem támogatja a fogyasztói NIC-ek nagy részét. Az [ehhez](https://github.com/loopback-kr/Intel-I219-V-for-Windows-Server) hasonló megoldási lehetőségekre viszont felfigyel az anti-cheat a driver érvénytelen [tanúsítványa](https://learn.microsoft.com/hu-hu/windows-hardware/drivers/dashboard/code-signing-cert-manage) miatt.

- NVIDIA DCH driver-ek Windows 10 1803 és annál feljebb támogatottak.

- Médialejátszás során kizárólag Windows 10 1709-en a Multimedia Class Scheduler Service (MMCS) felemeli a timer resolution-t 0.5ms-re ami korlátozzá a használni kívánt timer resolution beállítását.

- Windows 10 1809+ szükséges a Ray Tracing-hez NVIDIA GPU-kon.

- Windows 10 2004+ szükséges a [Hardware Accelerated GPU Scheduling](https://devblogs.microsoft.com/directx/hardware-accelerated-gpu-scheduling/) használatához ami létfontosságú a DLSS Frame Generation működéséhez [(1)](https://developer.nvidia.com/rtx/streamline/get-started).

- Windows 10 2004-22H2 már nem támogatott a Global Timer Resolution [(1)](https://randomascii.wordpress.com/2020/10/04/windows-timer-resolution-the-great-rule-change/). A Microsoft lehetővé tette hogy Windows Server 2022+ és Windows 11-en vissza lehessen állítani a Global Timer Resolutiont egy registry key segítségével 

- Windows 11-nek van egy frissített scheduler-je Intel 12th Gen és felette lévő CPU-k számára [(1)](https://www.anandtech.com/show/16959/intel-innovation-alder-lake-november-4th/3) azonban ezt replikálni lehet manuális affinity policy-k beállításával bármelyik Windows verzión.

- Windows 11 limitálja a háttérben lévő folyamatok polling rate-jét 125Hz-re [(1)](https://blogs.windows.com/windowsdeveloper/2023/05/26/delivering-delightful-performance-for-more-than-one-billion-users-worldwide/).

- AllowTelemetry-t 0-ra lehet állítani Windows Server verziókon [(1)](https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.DataCollection::AllowTelemetry).

- Windows Home verziók nem támogatják a Group Policy Editor-t ami szükséges lesz a rendszer konfigurálásához.

- Windows Server verziók nem támogatják az Xbox controllereket valamint PS controllerek esetén a DS4 programot.


## 4.2 Szükséges programok letöltése

- [7-Zip](https://www.7-zip.org/)

- [Windows ADK](https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install)

## 4.3 Stock ISO letöltése

Használd a ``certutil -hashfile <file>`` parancsot hogy ellenőrizd az ISO valódiságát/korruptságát. 

- ISO források:
 
  - [os.click](https://os.click/en)
  - [New Download Links](https://docs.google.com/spreadsheets/d/1zTF5uRJKfZ3ziLxAZHh47kF85ja34_OFB5C5bVSPumk/edit?gid=0#gid=0)
  - [Adguard File List](https://files.rg-adguard.net/)
  - [Server 2022](https://info.microsoft.com/ww-landing-windows-server-2022.html) - Akármit beírhatsz a sorokba, el fogja fogadni.

  
## 4.4 Build Environment előkészítése

- A Windows Defender-ben a Real-Time protection-t kapcsold mivel az lassíthatja a mount és unmount folyamatát, vagy hibát is okozhat.

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

- Állítsd be hova lesz mount-olva az ISO.

  ```bat
  set "MOUNT_DIR=%temp%\MOUNT_DIR"
  ```

-  Állítsd be az ``OSCDIMG`` változót az ``oscdimg.exe`` elérési útjára. Ha a Windows ADK-t az alapértelmezett helyre telepítetted nem kell a parancsot átírnod.

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
  if exist "%MOUNT_DIR%" (echo true) else (echo false)
  if exist "%OSCDIMG%" (echo true) else (echo false)
  ```

## 4.5 Nem használt verziók eltávolítása

Távolíts el minden nem kívánt verziót. Használd az alábbi parancsokat hogy megkapd az adott kiadás index-ét majd eltávolítsd azokat. A végére csak a telepíteni kívánt verziónak kell megmaradnia az 1-es indexen. 

 - Ajánlott verziók:

   - Professional

   - Windows Server esetén: Standard (Desktop Experience)

- Az összes elérhető verzió és a hozzájuk tartozó indexek lekérése

  ```bat
  DISM /Get-WimInfo /WimFile:"%EXTRACTED_ISO%\sources\install.wim"
  ```
 
- Távolítsd el a verziót index alapján. Cseréld ki az ``<index>``-et az index számmal.

  ```bat
  DISM /Delete-Image /ImageFile:"%EXTRACTED_ISO%\sources\install.wim" /Index:<index>
  ```

## 4.6 Mountold az ISO-t

Mountold az ISO-t az alábbi parancssal.

```bat
DISM /Mount-Wim /WimFile:"%EXTRACTED_ISO%\sources\install.wim" /Index:1 /MountDir:"%MOUNT_DIR%"
```

## 4.7 NET 3.5 bekapcsolása

```bat
DISM /Image:"%MOUNT_DIR%" /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:"%EXTRACTED_ISO%\sources\sxs"
```

# 4.8 Szükséges fájlok integrálása

[Klónold a repository-t](https://github.com/Martinnn527/PC-Tuning-HU/archive/refs/heads/main.zip) majd a ``bin`` mappát másold be a mountolt directory-ba:

```bat
explorer "%MOUNT_DIR%"
```

Ilyenkor érdemes az ethernet driver-t is bemásolni/integrálni.

## 4.9 Unmount és Commit

Futtasd az alábbi parancsot a módosítások véglegesítéséhez az ISO-n. Ha hibaüzenetet kapsz, ellenőrizd, hogy a directory üres-e az ``explorer "%MOUNT_DIR%"
`` beírásával. Ha üres, figyelmen kívül hagyhatod a hibaüzenetet, azonban ha nem akkor zárj be minden mappát és próbáld meg a parancsot újrafuttatni.

```bat
DISM /Unmount-Wim /MountDir:"%MOUNT_DIR%" /Commit && rd /s /q "%MOUNT_DIR%"
```

# 4.10 ISO Compression

Ennek nincs különösen semmi előnye a méret csökkentésén kívül. Azonban telepítés közben a Windows setup automatikusan végrehajtja ezt a folyamatot ami sok időbe telhet.

```bat
DISM /Export-Image /SourceImageFile:"%EXTRACTED_ISO%\sources\install.wim" /SourceIndex:1 /DestinationImageFile:"%EXTRACTED_ISO%\sources\install.esd" /Compress:recovery /CheckIntegrity && del /f /q "%EXTRACTED_ISO%\sources\install.wim"
```

## 4. 11 Átkonvertálás ISO-vá

Használd az alábbi parancsot a kicsomagolt tartalom visszacsomagolásához egyetlen ISO fájlba, amely a ``C:\`` meghajtón fog létrejönni.

```bat
"%OSCDIMG%" -m -o -u2 -udfver102 -l"Final" -bootdata:2#p0,e,b"%EXTRACTED_ISO%\boot\etfsboot.com"#pEF,e,b"%EXTRACTED_ISO%\efi\microsoft\boot\efisys.bin" "%EXTRACTED_ISO%" "C:\Final.iso"
```

## 4.12 Telepítés Ventoy használatával

Töltsd le a [Ventoy](https://github.com/ventoy/Ventoy/releases)-t majd indítsd el a ``Ventoy2Disk.exe``-t. Az option menüpontnál válaszd ki a partíciótípust (GPT) és kapcsold ki a secure boot support-ot, majd válaszd ki a pendrive-od és kattints az Install-ra.

  - Lásd [media/identify-bios-mode.png](/media/identify-bios-mode.png)

## 4.13 ISO-ba való bootolás

Ehhez a lépéshez húzd ki az ethernet kábeledet és ne legyél az internethez csatlakozva. Ezáltal elkerülhetjük a Microsoftba való bejelentkezést OOBE közben és a Windows nem fog automatikusan feltelepíteni frissítéseket és drivereket.

- File Explorer-ben másold át a Windows ISO-t a pendrive-ra.

- Ha a Secure Boot bevan kapcsolva, ideiglenesen kapcsold ki a telepítési folyamathoz. Boot-olj be a pendrive-ra BIOS-on belül és válaszd ki a Windows ISO-t. Folytasd a telepítést majd amikor végzett kapcsold vissza a Secure Boot-ot ha előzőleg bevolt.

## 4.14 OOBE Setup

- Windows Server telepítése során meg kell adnod egy komplex jelszót amit törölhetsz később.

- Ha Windows 11-et telepítesz nyomj egy ``Shift+F10``-et hogy megnyisd a CMD-t és írd be a következő parancsot: ``oobe\BypassNRO.cmd``. Ezáltal megjelenik a ``continue with limited setup`` opció.

  - Példa [main/media/oobe-windows10+-example.mp4](main/media/oobe-windows10+-example.mp4)

---

# 5. Post Install

## 5.1 Unrestricted PowerShell Execution Policy

Ez szükséges a scriptek futtatásához. Nyisd meg a PowerShell-t és másold be az alábbi parancsot.

```powershell
Set-ExecutionPolicy Unrestricted
```

## 5.2 Process Mitigations (Windows 10 1709+)

Nyisd meg az ``NSudo.LG.exe``-t, pipáld be az ``Enable All Priviliges`` checkbox-ot és írd be hogy ``cmd``, majd pedig másold be az alábbi parancsot

```bat
C:\bin\disable-process-mitigations.bat
```

## 5.3 Registry Script

- Nyisd meg a PowerShell-t adminként majd másold be az alábbi parancsot. Ha error-t kapsz, kapcsold ki a tamper protection-t Windows Defenderben (Windows 10 1909+). Ha így sem jó akkor boot-olj be Safe Mode-ba és futtasd ott a parancsot.

  ```powershell
  C:\bin\apply-registry.ps1
  ```

- Győződj meg róla hogy a script egy "succesfully applied" üzenetet ír. 

- Csakis egy újraindítás után csatlakozz az internethez.

## 5.4 Driverek telepítése

- GPU driverek később lesznek feltelepítve.

- Próbáld meg a driver-t INF formában feltelepíteni task manager-en belül mivel az exe-k általában bloatware-t tartalmaznak. Próbáld meg 7-zip-el kicsomgalni az exe fájlt és azon belül megkeresni az INF fájlt.

- NIC (Network Interface Controller) drivert telepítsd fel.

## 5.5 Windows Server konfigurálása

- Server Manager-ben, menj a ``Manage -> Server Manager Properties`` és pipáld be a ``Do not start Server Manager automatically at logon`` opciót.

- ``Win+R -> services.msc``, keresd ki a ``Windows Audio`` és ``Windows Audio Endpoint Builder`` szolgáltatásokat majd pedig a startup type-ot tedd Automatic-ra.

- ``Win+R -> gpedit.msc - >Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`` és kapcsold ki a ``Password must meet complexity requirements`` opciót.

   - Nyisd meg a CMD-t és írd be hogy ``gpupdate /force`` hogy egyből életbe lépjenek a változások.

- ``Win+R`` -> ``control userpasswords`` -> ``Users`` majd jobb klikk az ``Administrator``profilra, ``Set Password`` -> és hagyd üresen hogy eltávolítsd a jelszót.

- Windows Server-en globálisan kikapcsolható a Telemetry az alábbi CMD parancsokkal.

  ```bat
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WSDAPI\AppCompat" /v AllowTelemetry /t REG_DWORD /d "0" /f
  ```
  ```bat
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WSDAPI\AppCompat" /v AITEnable /t REG_DWORD /d "0" /f

## 5.6 Privacy Options

``Win+I`` -> ``Privacy`` és kapcsolj ki minden nem használt engedélyt.

## 5.7 Search Indexing

Bizonyos könyvtárak a fájlrendszeren indexelve vannak a Windows keresési funkcióihoz, amelyeket a Win+R megnyomása után a ``control srchadmin.dll`` beírásával megtekinthetsz. Az indexelés időszakosan a háttérben fut, és gyakran észrevehető CPU-terhelést okoz, amely a Process Explorer segítségével megfigyelhető, ahogyan az a [Process Explorer]() szekcióban levan írva. Ezért ajánlott a keresési indexelést globálisan letiltani a Windows Search szolgáltatás kikapcsolásával, azonban ez korlátozhatja a keresési funkciókat.

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f
```

## 5.8 Idő, nyelv és régió

- ``Win+R`` -> ``intl.cpl`` és  ``timedate.cpl``. Konfiguráld tetszésed szerint.

- ``Win+I -> Time & Language`` 

  - Ha kizárólag egy billentyűzet layout-ot tervezel használni akkor töröld ki az összes többit mivel véletlen megnyomhatod a hotkey-t ami átváltja a layout-ot, ami zavaró lehet.

- Szinkronizáld a rendszer óráját.

## 5.9 Böngésző konfigurálása

- Telepítsd fel az általad kedvelt böngészőt. Lásd: [privacytests.org](https://privacytests.org/)

  - Ha Firefox-ot szeretnél feltelepíteni használd az alábbi parancsot PowerShell-ben egy minimális telepítésért.

    ```powershell
    C:\bin\install-firefox.ps1
    ```

- Kapcsold ki a hardveres gyorsítást/hardware acceleration-t.

- Kapcsolj ki minden nyomkövetőt.

- Ajánlott kiegészítők:

   - uBlock Origin (Filter list-et állítsd be)
   - CleanURLs
   - FastForward

## 5.10 Ütemezett feladatok kikapcsolása

Nyisd meg a PowerShell-t majd másold be az alábbi parancsot.

```powershell
C:\bin\disable-scheduled-tasks.ps1
```

## 5.11 Egyéb beállítások

Nyisd meg a CMD-t és másold be az alábbi parancsokat:

- Ha használsz jelszót állítsd be hogy soha ne járjon le. Ezáltal a Windows nem fogja rendszeresen kérni hogy változtasd meg a jelszavad:

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

- Írd be a következőt Win+R-be: ``sysdm.cpl`` majd állítsd be az alábbiakat:

  ``Advanced -> Performance -> Settings -> Adjust for best performance``

- Kapcsolj ki mindent a Win+I megnyomásával, a **System -> Notifications and actions**-ben 
    
## 5.12 Runtime-ok feltelepítése

- [VcRedist](https://github.com/abbodi1406/vcredist)

- [DirectX](https://www.microsoft.com/en-gb/download/details.aspx?id=8109)

## 5.13 Optional Features

``Win+R -> Optional Features`` majd pedig állítsd be úgy ahogy a képen látható.

Ha a Windows Update kivan kapcsolva akkor nagy eséllyel nem fogsz tudni feltelepíteni funkciókat. Helyette DISM-el kell telepítened. Windows Serveren az ``OptionalFeatures`` megfelelője a
``Server Manager -> Manage -> Remove Roles and Features``

   - [Példa](/media/features-example.png)

## 5.14 Tray Icons

Jobb klikk a tálcára -> ``Taskbar settings -> Select which icons appear on the taskbar`` és kapcsold be az ``Always show all icons in the notifications area`` opciót.
Ez segít a futó folyamatok kezelésében és átláthatóságában. 

## 5.15 Hibernation

Ahogy a [BIOS](#212-fast-startup-standby-és-hibernate) szekcióban leírtam, a Hibernation-t a Windowson belül is ki lehet kapcsolni. Így a PC egy tiszta shut down-t fog végrehajtani a gép leállításakor a szoftverállapot lemezre mentése helyett. Nyisd meg a CMD-t és másold be az alábbi parancsot.

```bat
powercfg /h off
```

## 5.16 Bloatware kezelése

Javasolt a debloat scriptek elkerülése és az olyan komponensek eltávolítása ami nem ténylegesen bloatware, mivel ez az operációs rendszer meghibásodásához vezethet.

- Még nem ajánlott letörölni az Xbox Game Bar-t mivel a későbbi lépésekben problémába ütközhetsz ([Játék regisztrálása Game Bar-ban](#5352-játék-regisztálása-game-bar-ban)).

  - [AppxPackagesManager](https://github.com/valleyofdoom/AppxPackagesManager) használatával távolítsd el a nem kívánt programokat.

  - Nyisd meg a CMD-t és töröld le a OneDrive-ot az alábbi parancssal.

    ```bat
    for %a in ("SysWOW64" "System32") do (if exist "%windir%\%~a\OneDriveSetup.exe" ("%windir%\%~a\OneDriveSetup.exe" /uninstall)) && reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
    ```  

- Chromium Microsoft Edge letiltása (nem letörlése). A böngészőt letiltani kell nem pedig letörölni a WebView Runtime megtartása érdekében.
        
  - Nyisd meg a Microsoft Edge-t majd pedig a beállításokban kapcsolj ki bármilyen automatikus start-up beállítást mint pl. a lent felsoroltak

      - ``Startup boost``
      - ``Continue running background extensions and apps when Microsoft Edge is closed``

    - Töltsd le az [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)-t és navigálj az ``Everything`` részhez, majd keress rá az ``Edge`` kifejezésre és pipálj ki mindent ami megjelenik.

    - A böngésző frissítése visszaállít néhány beállítást. Használd az alábbi parancsot hogy ez ne forduljon elő. Ha error-t ír, Task Managerben zárj be minden rejtett Microsoft Edge folyamatot.

     ```bat
     rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
     ```

   - Töröld ki az összes Edge-hez tartozó shortcut-ot.

   ```bat
   for /f "delims=" %a in ('where /r C:\ *edge.lnk*') do (del /f /q "%a")
   ```

- A start menüben távolítsd el az alkalmazások parancsikonjait. Fontos megjegyezni, hogy ezek az alkalmazások valójában nincsenek telepítve--csak akkor települnek ha rájuk kattintasz.

- ``Win+I -> Apps -> Apps & Features -> Optional Features`` és törölj le mindent kivéve a ``Notepad``-et, ``WordPad``-et és ``Windows Media Player``-t. Windows 11-en a ``WMIC`` is maradjon.

- A ``smartscreen.exe`` figyelmen kívül hagyja a registry key-t ami szabályozza hogy fut-e, ezért át kell nevezni az exe-t hogy ne tudjon elindulni. Nyisd meg a CMD-t és másold be az alábbi parancsokat.

```powershell
C:\bin\MinSudo.exe --TrustedInstaller --Privileged
```

```bat
taskkill /f /im smartscreen.exe > nul 2>&1 & ren C:\Windows\System32\smartscreen.exe smartscreen.exee
```

- Használd a Task Manager-t hogy ellenőrizd nem-e fut semmilyen bloatware a háttérben.

## 5.17 7-Zip letöltése és beállítása

- [7-zip](https://www.7-zip.org/a/7z2301-x64.exe)

- Nyisd meg a ``C:\Program Files\7-Zip\7zFM.exe-t`` , ``Tools -> Options`` és add hozzá a 7-Zip-et az összes fájl típushoz a ``+`` gombra kattintva. Lehetséges hogy kétszer kell megnyomnod hogy felülírd a már hozzáadott fájl típusokat.

## 5.18 GPU Driver

Lásd [docs/configure-nvidia.md](/docs/confiugre-nvidia.md)

## 5.19 MSI Afterburner

- Töltsd le az [MSI Afterburner](https://www.msi.com/Landing/afterburner/graphics-cards)-t és telepítsd fel.

- Állíts be egy magas, statikus fan speed-et mivel a fan curve funkció működéséhez futnia kell a programnak.

- Hogy a rendszer automatikusan betöltse az 1. profilt (például) és utána bezárja a programot, menj be ``shell:startup``-ba -> jobb klikk -> ``Create a Shortcut`` és másold be az következőt:

  ```bat
  "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" /Profile1 /Q
  ```

## 5.20 Felbontások és Scaling Mode

- Keress egy stabil OC-t a monitorodhoz, az NVIDIA control panelben a ˙˙Change resolution -> Customize -> Create Custom Resolution˙˙ fülnél vidd feljebb a refresh rate-t ~3-asával amíg a monitor nem ír egy ``Out of Range`` üzenetet vagy pedig csak szimplán fekete a képernyő. Ha ez történik, csak várj 15 másodpercet és automatikusan visszaáll az előzőleg használt értékekre. Majd pedig egyesével vedd visszább a refresh ratet. Például ha 250 hz-ről ugrottál 253 hz-re és fekete volt a képernyő akkor 252-től indulva menj lejjebb amíg stabil nem lesz. Ezután teszteld [itt](https://www.testufo.com/) hogy nincs e screen tearing.

- Általában két lehetőséged van: Display, vagy GPU scaling. A monitorod natív felbontása nem igényel scalinget ezáltal identity scaling-et ([1](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ne-wingdi-displayconfig_scaling)), ([2](/docs/research.md#2-identity-scaling) használhatsz. 

- Állíts be egy ``egész`` refresh ratet (a legmagasabbat amit az első pontnál eltudtál érni), például 60,00/240,00, nem 59,94/239,76. Ennek elérése érdekében használd az ``Exact``vagy pedig ``Exact reduced`` timing-ot [CRU](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)-ban mivel a többi egy picit eltérő lehet, például 239.xxx.

- Töröld az összes felbontást és egyéb bloatwaret (audio blocks) az alap felbontásodon kívül.
 
  - [Példa](/media/cru-example.png)  

- Ha NVIDIA GPU-d van, győzödj meg róla hogy a ``Display`` opció a ``Perform scaling on`` beállításnál még mindig elérhető. Ha nem, futtasd a CRU mappájában lévő reset.exe-t hogy visszaállítsd a beállításokat alapra és konfiguráld újra a CRU-t. Minden változtatás után futtasd a restart64.exe-t hogy megtudd mi volt az ami a problémát okozta.

- Ellenőrizd hogy a CRU-ban generált felbontás van-e használatban: ``Win+I:  System ->  Advanced display settings``

## 5.21 Open-Shell

Ezt szükséges feltelepíteni mivel a start-menüvel és a Windows Search-el kapcsolatos szolgáltatások ki lesznek kapcsolva.

- [Open-Shell](https://github.com/Open-Shell/Open-Shell-Menu)

- Csak az ``Open-Shell Menu``-t telepítsd fel.

- ``Settings -> General Behavior -> Check for Windows updates on shutdown`` - Disabled

- Opcionálisan használd a **bin** mappában lévő XML fájlt egy letisztult beállításért. Backup -> Load from XML file.

## 5.22 Spectre, Meltdown és CPU Microcode

A Spectre és Meltdown letiltása egy régóta ismert teljesítményjavító trükk. Azonban az újabb platformok és rendszerarchitektúrák esetén előfordulhat teljesítménycsökkenés ([1](https://www.phoronix.com/review/amd-zen4-spectrev2)). Éppen ezért fontos benchmarkokat végezni, hogy meghatározzuk, hogy a teljesítmény pozitívan, negatívan vagy egyáltalán nem változik. Az állapota az  [InSpectre](https://www.grc.com/inspectre.htm) programmal, illetve a microcode DLL-ek átnevezésével állítható attól függően, hogy van-e microcode verzió eltérés az operációs rendszer és a BIOS között ([1](https://superuser.com/a/895447), [2](https://support.mozilla.org/en-US/kb/microcode-update)). 

<details>
<summary>Instrukció a DLL-ek átnevezésére</summary>

Nyisd meg a CMD-t majd pedig másold be a következőt: ``C:\bin\MinSudo.exe --TrustedInstaller --Privileged``. Ezután futtasd az alábbi kettő parancsot.

```bat
ren C:\Windows\System32\mcupdate_GenuineIntel.dll mcupdate_GenuineIntel.dlll
```

```bat
ren C:\Windows\System32\mcupdate_AuthenticAMD.dll mcupdate_AuthenticAMD.dlll
```

</details>

A Meltdown nincs hatással az AMD-s rendszerekre ([1](https://www.theverge.com/2018/1/3/16844630/intel-processor-security-flaw-bug-kernel-windows-linux), [2](https://www.phoronix.com/news/x86-PTI-Initial-Gaming-Tests), [3](https://lkml.org/lkml/2018/1/3/425)) és szükséges pár anti-cheat működéséhez (FACEIT).

## 5.23 Power Plan

- Állítsd be a high performance power plant:

```bat
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
```

- Töröld ki a balanced power plant:

 ```bat
 powercfg /delete 381b4222-f694-41f0-9685-ff5bb260df2
 ```

- Töröld ki a power saver power plant: 

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

- Disable core parking: 

```bat
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100
```

- Processor performance time check interval - 5000ms: 

```bat
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000
```

- Végül pedig:

```bat
powercfg /setactive scheme_current
```

## 5.24 Memory Management beállítások
- Nyisd meg a PowerShell-t és másold be az alábbi parancsot hogy megtekintsd a beállításokat

```powershell
Get-MMAgent
```

- Használd az alábbi példát hogy kikapcsolj egy adott beállítást. Ha a Superfetch/Prefetch-et bekapcsolva hagytad az [Egyéb](#511-egyéb-beállítások) szekcióban akkor nagy valószínűséggel a Prefetch-el kapcsolatos funkciókra szükséged van.

```powershell
Disable-MMAgent -MemoryCompression
```

## 5.25 BCD Store

[DEP (Data Execution Prevention)](https://learn.microsoft.com/en-us/windows/win32/memory/data-execution-prevention) kikapcsolása:

```bat
bcdedit /set nx AlwaysOff
```

A [disabledynamictick](https://en.wikipedia.org/wiki/Tickless_kernel) parancs használható a rendszeres timer tick interrupts engedélyezésére.

```bat
bcdedit /set disabledynamictick yes
```

## 5.26 NIC konfigurálása

- ``Win+R``-be írd be hogy ``ncpa.cpl``. 

- Tilts le minden nem használt adaptert. Jobb klikk a fő adapterre és ``Properties``

- Kapcsold ki az összes funkciót kivéve a ``QoS Packet Scheduler``-t (Ha a router-ed támogatja és használni tervezed) és az ``Internet Protocol Version 4 (TCP/IPv4)``-et.

- Állíts be egy Static IP Address-t. Nyisd meg a CMD-t majd írd be hogy ``ipconfig /all``. Jobb klikk a fő adapteredre, ``Properties``, majd pedig kattints rá az ``Internet Protocol Version 4 (TCP/IPv4)``-re és írd át manuálisan az összes beállítást a CMD-ben kiírtaknak megfelelően.

## 5.27 Audio eszközök beállítása

- Nyisd meg a sound control panel-t: ``Win+R : mmsys.cpl``

- Tiltsd le az összes nem használt Playback és recording eszközt.

- A communications fülnél állítsd be hogy ``Do nothing``

## 5.28 Process Explorer

Használj Process Explorer-t mivel a stock Task Manager a CPU kihasználtságát %-ban jelzi ami félrevezető lehet [1](https://aaron-margosis.medium.com/task-managers-cpu-numbers-are-all-but-meaningless-2d165b421e43). Ezzel ellentétben a Process Explorer idő-alapú terhelést mutat.

- [Töltsd le](https://download.sysinternals.com/files/ProcessExplorer.zip) majd pedig csomagold ki.

- Másold ki a **procexp64.exe**-t egy biztonságos helyre mint pl. **C:\Windows** majd nyisd meg.

- **Options** -> **Replace Task Manager**. Innentől ha megnyitod a Task Manager-t automatikusan a Process Explorer nyílik meg. Opcionálisan állítsd be a továbbiakat:

  - Confirm Kill 

  - Allow Only One Instance
  
  - Always On Top (jól jön ha a játék crashel vagy lefagy)

  - **View** -> **Select Columns** -> **Process Performance** majd pedig pipáld be a **Context Switch Delta**-t és a **CPU Cycles Delta**-t.


## 5.29 Szolgáltatások és driverek

> [!CAUTION]
> Mindent figyelmesen olvass el és értelmezz mielőtt hozzákezdesz.

Ez a helyes módja a szolgáltatások kikapcsolásának. Nem kell egyesével kikapcsolni őket, ami alapból nem is lenne visszafordítható, kivéve ha mindent manuálisan visszakapcsolsz, ami egyáltalán nem praktikus. Ezért lesz kettő script létrehozva amivel váltani tudsz az Enabled és Disabled között.

- Töltsd le a [service-list-builder](https://github.com/valleyofdoom/service-list-builder)-t.

- A lista testreszabható a ``C:\bin\minimal-servies.ini`` módosításával. Számos leírás van az adott szolgáltatással kapcsolatban a connfigban. Például ha ethernetet használsz a Wi-Fi-vel kapcsolatos szolgáltatásokra nincsen szükséged. Ha újra szeretnéd generálni a scripteket, előtte mindenképpen futtasd a ``Services-Enable``-t mivel a program a szolgáltatások jelenlegi állapotára támaszkodik a jövőbeli scriptek megépítésére.

- A ``High precision event timer`` eszkösz a device manager-ben IRQ 0-t használ a legtöbb AMD-s rendszeren, ezáltal konfliktusba kerül a ``System Timer`` eszközzel amely szintén IRQ 0-t használ. Az egyetlen mód ennek megoldására az, hogy letiltod a ``System Timer`` szülő eszközét, amely az ``msisadrv`` (Módosítsd a konfigot).

- Használd az alábbi parancsot hogy a Software Protection ne próbáljon elindulni 30 másodpercenként miközben a szolgáltatások kivannak kapcsolva.

```bat
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v "InactivityShutdownDelay" /t REG_DWORD /d "4294967295" /f
```

- Nyisd meg a CMD-t a ``service-list-builder`` mappájában.

- Másold be az alábbi parancsot hogy megépítsd a scripteket.

```bat
service-list-builder.exe --config C:\bin\minimal-services.ini
```

- Ha esetleg nem működik, add hozzá a ``--disable-service-warning" paramétert.

- A scriptek a ``build`` mappában lesznek megépülve. NSudo-val az ``Enable All Priviliges`` bepipálásával kell futtatni őket.

## 5.30 Device manager beállítása

- A ``Disk drives`` kategóriánál jobb klikk az SSD-re -> ``Polciies`` -> és pipáld be a ``Turn off Windows write-cache buffer flushing on the device`` opciót.

- A ``Network adapters`` kategóriánál ``Properties -> Advanced`` és kapcsolj ki minden power saving funkciót.

- ``View -> Devices by connection`` és tilts le minden PCIe, SATA, NVMe, XHCI controllert és USB Hub-ot amihez nincs semmi csatlakoztatva. Tilts le minden nem használt eszközt ami ugyanahhoz a PCIe port-hoz van csatlakoztatva mint a GPU

- ``View -> Resources by connection`` és tilts le minden nem szükséges eszközt ami IRQ-t vagy I/O-t használ. 

- Opcionálisan használd a [DeviceCleanup](https://www.majorgeeks.com/mg/getmirror/device_cleanup_tool,1.html) programot hogy eltávolíts rejtett eszközöket.

## 5.31 Device Power Saving

- Nyisd meg a PowerShell-t és másold be az alábbi parancsot hogy kikapcsold az ``Allow the computer to turn off this device to save power`` opciót a device manager-ben minden alkalmaz eszközön.

```powershell
Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }
```

- Ha kihúzod és visszadugod az eszközt akkor ez a beállítás visszaállhat tehát vagy kerüld el vagy futtasd a parancsot minden alkalommal, vagy pedig használd a [DriverPowerSaving](/bin/DriverPowerSaving.ps1) scriptet. Hogy minden újraindításnál automatikusan fusson húzd be ``shell:startup``-ba és használd a PowerShell paramétert hogy ne notepad-ként fusson.

## 5.32 Fájl rendszer

Nyisd meg a CMD-t és másold be az alábbi parancsokat.

- Tiltsd le a [8.3-as fájlnevek](https://hu.wikipedia.org/wiki/8.3-as_f%C3%A1jln%C3%A9v) készítését FAT és NTFS formátumú meghajtókon

```bat
fsutil behavior set disable8dot3 1
```

Tiltsd le a [Last Acces Time Stamp Update](https://www.tenforums.com/tutorials/139015-enable-disable-ntfs-last-access-time-stamp-updates-windows-10-a.html)-et.

```bat
fsutil behavior set disablelastaccess 1
```

## 5.33 Event Trace Sessions (ETS)

- Ezekkel a fájlokkal automatikusan tudsz váltani ETS Enabled és Disabled között aminek a hatását meg tudod nézni itt: ``Win+R -> perfmon -> Data Collector Sets -> Event Trace Session``. Azok a programok amelyek event tracing-re támaszkodnak nem fognak tudni adatot log-olni (pl. Event Viewer) amíg nem kapcsolod vissza őket, és pont ezért van egy enable és disable fájl. Nyisd meg a CMD-t és másold be a parancsokat hogy megépítsd a két registry fájlt a ``C:\`` meghajtón. NSudo-val kell majd futtatni őket Trusted Installer-ként.

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

## 5.34 Message Signaled Interrupts

- Az MSI-k gyorsabbak mint a hagyományos signal-based interruptok és az IRQ sharing problémát is megoldhatják

- Töltsd le a [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy)-t.

- Kapcsold be az MSI-ket az összes támogatott eszközön. Vedd figyelembe hogy néhány driver fejlesztő alapból kikapcsolva hagyja az MSI-ket, tehát ha újratelepítesz egy drivert utána mindig érdemes ellenőrizni.

## 5.35 XHCI Interrupt Moderation (IMOD)

Windows 7-en az IMOD Interval 1ms, viszont az újabb OS-eken 0.05ms (50us) kivéve ha az adott USB drivernél más van megadva. Ez azt jelenti hogy amiután egy Interrupt generálva lett, az XHCI(USB) controller vár (úgynevezett buffer period) hogy több adat érkezzen mielőtt újabb Interruptot generálna. Ez csökkenti a CPU terhelését de adatvesztéshez vezethet.
Példa: egy 1000-es polling rate-ű egér minden 1ms-ban küld adatot. Ha csak az egeret mozgatod egy 1ms-os intervallumban akkor nem történik Interrupt Moderation, mivel az interruptok generálási sebessége kisebb vagy egyenlő a meghatározott intervallummal. Azonban játék közben, ahol egyszerre mozgatod az egeret, nyomod a billentyűzetet stb, könnyen meghaladod az 1000 interrupt/másodpercet. Habár ez kevésbé valószínű 0,05 ms-os IMOD intervallum mellett, akkor is előfordulhat.

- Töltsd le az [RWEverything](http://rweverything.com/download/)-et és másold be az alábbi parancsot hogy letiltsd a ``Microsoft Vulnerable Driver Blocklist``-et. 

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f
```

- A ``bin`` mappában lévő [XHCI-IMOD-Interval.ps1](/bin/XHCI-IMOD-Interval.ps1) fájlt másold be a C:\-be. Ha az RWEverything-et máshova telepítetted akkor a ps1 fájlban a ``$rwePath = "C:\Program Files\RW-Everything\Rw.exe"`` sort írd át. Csinálj egy shortcut-ot ``shell:startup``-ba. Jobb klikk a fájlra -> ``Properties -> Shortcut`` és a Target helyére másold be az alábbi sort.

```bat
PowerShell C:\XHCI-IMOD-Interval.ps1
```

## 5.36 Applikációk konfigurálása

### 5.36.1 FPS Limit

- Ha limitálod az FPS-t akkor a monitorod refresh rate-jének a többszörése korlátozd le. Lásd: [FPS Cap Calculator | BoringBoredom](https://boringboredom.github.io/tools/fpscapcalculator)

- Bizonyosodj meg róla hogy a GPU nincs teljesen kihasználva mivel minél kevesebb a kihasználtsága annál kevesebb a system latency.

- Ha RTSS-el limitálod az FPS-t sokkal smoothabb lesz a játék és konzisztensebb lesz a frame-pacing mivel busy-wait-et használ ami sokkal precízebb mint a passive-wait de cserébe nagyobb latency-vel és CPU overhead-el jár.

### 5.36.2 Játék regisztálása Game Bar-ban

Győződj meg róla hogy a Game Bar felismeri a játékot. Nyisd meg a Game Bar-t ``Win+G`` megnyomásával amikor játékban vagy és kapcsold be a ``Remember this is a game`` opciót. 

### 5.36.3 Presentation Mode

Lásd: [Presentation Models](https://wiki.special-k.info/en/Presentation_Model)

- Ez nem egy ajánlás hogy melyik Presentation Mode-ot használd, inkább csak informatív okból írom le.

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

### 5.36.4 Game Mode

A Game Mode megakadályozza a Windows Update futását valamint bizonyos értesítések megjelenítését ([1](https://support.xbox.com/en-GB/help/games-apps/game-setup-and-play/use-game-mode-gaming-on-pc)). Fontos megjegyezni, hogy a Game Mode befolyásolhatja a folyamatok és thread-ek prioritását, attól függően, hogy a PsPrioritySeparation értéke hogyan van beállítva. Érdemes kísérletezni a Game Mode engedélyezésével és letiltásával, hogy meghatározd annak hatását a rendszer teljesítményére.

### 5.36.5 Media lejátszó

- [mpv](https://mpv.io/)
- [VLC](https://www.videolan.org/)
- [mpc-hc](https://github.com/clsid2/mpc-hc)

### 5.36.6 QoS Policy

Abban az esetben ha a routered támogatja a Quality of Service beállítást, akkor [konfigurálható egy QoS Policy](/media/dscp-46-qos-policy.png) hogy egy megadott applikáció csomagjait helyezze előnybe a többi applikációval szemben. Ezt vagy a router oldalán, vagy pedig egy külön [applikációban](https://www.microsoft.com/en-us/download/details.aspx?id=4865) tudod ellenőrizni. [New Capture](/media/network-monitor-new-capture.png), nyisd meg a játékot, amelyre DSCP-értéket állítottál be, és reprodukálj egy olyan helyzetet, amelyben csomagok küldésére és fogadására kerül sor mint pl. egy online meccs. Nyomj egy F5-öt hogy elkezdd a logolást, 30 mp után pedig egy F7-et. A bal oldali ablakban kattints a játék nevére, majd kattints egy packet headerre. Bővítsd a packet info-t a frame deatils alatt, és végül bővítsd az Ipv4 alkategóriát. Ekkor láthatóvá válik az egyes folyamatok aktuális DSCP-értéke: ``"DifferentiatedServices Field: DSCP: 46, ECN: 0"``.

### 5.36.7 Discord

- Data & Privacy - Use data to improve Discord - OFF

- Voice & Video - Hardware Acceleration - OFF

- Voice & Video - Enable Quality of Service High Packet Priority - OFF

- Advanced - Hardware Acceleration - OFF

- Game Overlay - OFF

Opcionálisan használj [DiscordFixer](https://github.com/HerXayah/Discord-Fixer)-t. 

  - Lásd [/research.md/discord-fixer](/docs/research.md#3-discordfixer)

### 5.36.8 Epic Games

Néhány Epic-es játéknál automatikusan fut az **EOSOverlayRenderer-Win64-Shipping.exe** ami általában a **C:\Program Files (x86)\Epic Games\Launcher\Portal\Extras\Overlay** directory-ban található. Használd az alábbi parancsot hogy átírd a nevét, abban az esetben ha az Epic Games-t az alapértelmezett helyre telepítetted. Játékbeli vásárlásokhoz (pl. VBucks feltöltés) kötelező futnia. Ebben az esetben csak írd vissza a nevét és indítsd újra a játékot.

```bat
ren "C:\Program Files (x86)\Epic Games\Launcher\Portal\Extras\Overlay\EOSOverlayRenderer-Win64-Shipping.exe" EOSOverlayRenderer-Win64-Shipping.exee
```
Amiután elindítasz egy játékot, az Epic Games Launcher továbbra is fut a háttérben azonban bezárható a Steam-mel ellentétben.

### 5.36.9 Steam 

- Bal fent **Steam** -> **Settings** -> **Interface**, kapcsold ki az **Enable smooth scrolling in web view** és az **Enable GPU Accelerated rendering in web views** opciót.

- **Library** -> kapcsold be a **Low Bandwith Mode**-ot, **Low Performance Mode**-ot és a **Disable Community Content**-et.

Töltsd le a [NoSteamWebHelper](https://github.com/Aetopia/NoSteamWebHelper)-t.

- Másold be az **umpdc.dll**-t abba a mappába ahol a Steam.exe található.

Így mostantól automatikusan bezáródik a CEF/Chromium Embedded Framework amikor elindítasz egy játékot azonban amikor bezárod újra elindul hogy maga a Steam applikáció elérhető legyen. Vedd figyelembe hogy a Steam overlay nem lesz elérhető játék közben.

## 5.37 Interruptok és DPC-k

A Windows CPU 0-án ütemez számos interruptot és DPC-t ami elég terhelő lehet egyetlen-egy CPU számára. Ezért affinity-ket kell beállítani és elkülöníteni/eloszlatni a drivereket.

- Használd a [GoInterruptPolicy](https://github.com/spddl/GoInterruptPolicy) programot az affinity-k beállítására. Az adott eszközt úgy azonosíthatod, hogy összehasonlítod a ``Location``-t Device Managerben a ``Properties -> General`` résznél a GoInterruptPolicy-ban lévő ``Location Info``-val.

### 5.37.1 GPU és DirectX Graphics Kernel

Használhatod az [AutoGpuAffinity](https://github.com/valleyofdoom/AutoGpuAffinity)-t hogy benchmarkold az összes CPU-t. Ez segíthet eldönteni melyik CPU-n kerüljön feldolgozásra a GPU.

### 5.37.2 XHCI és Audio controller

Ez a két modul nagy számban generál interruptokat ezért érdemes elkülöníteni a kettőt ha nem USB audio-t használsz.

### 5.37.3 Network Interface Card (NIC)

Támogatnia kell az MSI-X-et ahhoz hogy az ISR azon a CPU-n fusson amelyik végrehajtja a DPC-ket. Figyelj arra hogy az RSS beállítás szabja meg hogy pontosan hány CPU-n van ütemezve a NIC. Például, ha az RSSBaseCpu a CPU 2-re van állítva és 4 RSS Queue-t használsz akkor a 2/3/4/5-ön lesz ütemezve.

  <details> 
  <summary>RSS beállítása</summary>

  - Navigálj a következő registry key-hez: ``HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000``, használd a te driveredhez tartozó [Driver Key](/media/find-driver-key-example.png)-t.

  - Add hozzá/írd át a következő értékeket (mindegyik **String**):

    - ``*RSSProfile`` - "4" - különben a többi érték figyelmen kívül maradhat 
    - ``*RSS`` - "1" = Enable RSS - "0" = Disable RSS
    - ``*RSSBaseProcNumber`` - A te általad használni kívánt base CPU
    - ``*NumRssQueues`` - RSS Queue-k száma
    - ``*MaxRssProcessors`` - Állítsd ugyanarra mint a ``*NumRssQueues`` (Csak Intel NIC)

 - Állítsd be GoInterruptPolicy-ban az MSI Limit-et ugyanannyira vagy többre mint a ``*NumRssQueues``. 

 - Intel NIC-eken állítsd a policy-t ``IrqPolicySpreadMessagesAcrossAllProcessors``-ra, Realtek-en pedig ``IrqPolicySpecifiedProcessors``-ra, majd állíts be egy olyan affinity-t amely megfelel a registry-ben konfigurált beállításoknak (pl. ha ``*RSSBaseProcNumber`` "4", és a ``*NumRssQueues`` "2", akkor válaszd ki az 4, 5 CPU-t).

 >
 > Néhány Realtek NIC-en nem funkcionál megfelelően az RSS hogyha több mint 1 RSS Queue van beállítva. A Hyperthreading/SMT kikapcsolása megoldhatja ezt a problémát.

A változtatások után ellenőrizd [xperf](/bin/xperf-dpcisr.bat)-el hogy működik e a kívánt konfiguráció.

</details>

- Lásd [Hány RSS Queue-ra van szükséged](/docs/research.md#hány-rss-queue-ra-van-szükséged)

Amiután kész vagy az előbbi lépésekkel töltsd le a [Windows ADK](https://go.microsoft.com/fwlink/?linkid=2289980)-t, telepítsd fel a Windows Performance Analyzer-t és használd a ``bin`` mappában lévő [xperf-dpcisr.bat](/bin/xperf-dpcisr.bat) scriptet hogy megfigyeld helyesen működnek e az affinity policy-k.

  - Ellenőrizd hogy egy ISR-hez tartozó DPC ugyanazon a CPU-n kerül-e feldolgozásra. ([példa](/media/isr-dpc-same-core.png))

## 5.38 Event Viewer ellenőrzése

Ez a lépés nem kötelező, azonban segíthet a megmagyarázhatatlan FPS drop-ok és többi probléma azonosításában. Ellenőrizd hogy nincs e teli hibaüzenettel az Event Viewer. ``Win+R`` -> ``eventvwr.msc``. 

  - Futtasd az ``ets-enable.reg`` fájlt mivel ez szükséges az event log működéséhez.

## 5.39 CPU Idle States

Ez kényszeríti a C-State 0-t. Érdemes játék előtt kikapcsolni, majd játék után bekapcsolni az idle statet, mivel az magasabb hőfokokkal (A CPU hőmérsékletének nem lenne szabad elérni a thermal throttling pontot, mivel a hűtéssel már foglalkoztál a [BIOS](#12-hűtés) részlegnél) és energiafogyasztással jár. Kerüld az idle kikapcsolását ha a Hyper-Threading/Simultaneous Multithreading bevan kapcsolva, vagy pedig ha valamilyenféle frequency boosting feature-t használsz, mint például AMD-n a PBO, Turbo Boost vagy hasonló. 

   - [Idle Enable](/bin/enable_idle.bat)
   - [Idle Disable](/bin/disable_idle.bat)

## 5.40 Timer Resolution

A clock interrupt frequency az a sebesség, amellyel a rendszer hardveres órája interruptokat generál, amelyek lehetővé teszik a scheduler számára különböző feladatok elvégzését. A legtöbb rendszeren alapértelmezés szerint a minimális frekvencia 64 Hz, ami azt jelenti, hogy 15,625 ms-onként generálódik egy clock interrupt. Az alacsonyabb frekvencia a kevesebb interruptoknak köszönhetően kisebb CPU-overhead-et és energiafogyasztást eredményez, de csökkenti a timing pontosságot és potenciálisan kevésbé responsive-abb multi-taskingot eredményez. A maximális frekvencia 2kHz, ami azt jelenti, hogy 0,5ms-enként generálódik egy clock-interrupt. A magasabb frekvencia nagyobb időzítési pontosságot és potenciálisan nagyobb multitasking-reakciókészséget eredményez, de növeli a CPU overheadet és az energiafogyasztást. A minimális, az aktuális és a maximális felbontás a [ClockRes](https://learn.microsoft.com/en-us/sysinternals/downloads/clockres)-ben tekinthető meg.


Az alapértelmezett 15,625ms-os felbontásnál nagyobb pontosságot igénylő alkalmazások képesek megemelni az órajel interrupt frekvenciát olyan funkciókkal, mint a [timeBeginPeriod](https://learn.microsoft.com/en-us/windows/win32/api/timeapi/nf-timeapi-timebeginperiod) és az [NtSetTimerResolution](http://undocumented.ntinternals.net/index.html?page=UserMode%2FUndocumented%20Functions%2FTime%2FNtSetTimerResolution.html), amelyekben, ezek a forgatókönyvek jellemzően multimédiás lejátszásból, játékból, VoIP-tevékenységből és másból állnak, ami látható egy energy trace futtatásával. A Sleep-el kapcsolatos funkciókra támaszkodó funkciók pontosságát az események ütemezésében közvetlenül befolyásolja az clock interruptok gyakorisága [(1)](https://randomascii.wordpress.com/wp-content/uploads/2020/10/image-5.png). A [Sleep](https://learn.microsoft.com/en-us/windows/win32/api/synchapi/nf-synchapi-sleep) példáján keresztül a Sleep(n) funkciónak valójában n milliszekundumot kell aludnia, és nem n plusz/mínusz egy tetszőleges értékig, különben váratlan és következetlen event pacing-et eredményez ami nem ideális az olyan funkciók számára mint a sleep-based FPS limiterek. Megjegyzendő, hogy ez csak egy példa és sok valós idejű alkalmazás nem támaszkodik kifejezetten a Sleep funkcióra az event-pacing-hez. Egy tipikus érték, amelyre a játékfejlesztők a felbontást látszólag emelik, az 1ms, ami azt jelenti, hogy az alkalmazás az eventek ütemét 1ms-os felbontáson belül tudja tartani. Nagyon ritka esetekben előfordul, hogy a fejlesztők egyáltalán nem emelik meg a felbontást, miközben az alkalmazásuk az event-pacing pontossága miatt erre támaszkodik, de ez nem gyakori, és csak néhány ismeretlen programra, például kevésbé ismert játékokra vonatkozhat.

A timer resolution megvalósítása a Windows 10 2004+-ben úgy változott, hogy a hívó folyamat felbontásának emelése nem befolyásolja a rendszert globális szinten, vagyis az A folyamat 1 ms-ra emelése nem befolyásolja a B folyamatot az alapértelmezett 15,625 ms-os felbontásnál, ellentétben a korábbiakkal. Ez önmagában nagyszerű változás, mert csökkenti az overhead-et, mivel más folyamatok, például a tétlen háttérfolyamatok nem kapnak gyakran kiszolgálást a scheduler-től, és a hívó folyamat szükség szerint nagyobb pontosságot kap. Azonban ez korlátokat eredményez, ha nagyobb felbontást, például 0,5ms-ot szeretnénk kihasználni. Tekintettel arra, hogy a játékok nem nyílt forráskódúak a kód módosításához, valamint a DLL-injection-t vagy binary patching-et megakadályozza az anticheat, az egyetlen lehetőség az, hogy globálisan állítod be, amely az alábbi registry directory-ban alkalmazható Windows Server és Windows 11+ rendszereken.

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d "1" /f
```

Ez lehetővé teszi a felbontás növelését egy külön folyamat során, ami azt eredményezi, hogy a kívánt alkalmazás, például egy játék nagyobb pontosságot kap. Azonban, mint korábban említettük, a folyamatonkénti mód csökkenti a CPU-overhead-et, ami a globális beállítás visszaállítása esetén már nem áll fenn, és a háttérfolyamatok is szükségtelenül gyakran kiszolgálásra kerülnek. Az RTSS egy alternatív módszer a framerate korlátozására, és hybrid-waiting-et használ, ami nagyobb pontosságot eredményez, miközben megszűnik a GlobalTimerResolution visszaállításának szükségessége.

A nagyobb felbontás nagyobb Sleep pontosságot eredményez, de bizonyos esetekben a maximálisan támogatott 0,5 ms felbontás pont hogy kisebb pontosságot biztosít, mint a valamivel alacsonyabb, például 0,507 ms. Ezért célszerű a [MeasureSleep](https://github.com/valleyofdoom/TimerResolution) programban meghatározni, hogy melyik felbontással a legkisebb a Sleep(1) (delta), miközben a [SetTimerResolution](https://github.com/valleyofdoom/TimerResolution/releases) programmal különböző felbontásokat állítunk be. Ezt terhelés alatt kell elvégezni, mivel az idle benchmarkok félrevezetőek lehetnek. A folyamat automatizálására a [micro-adjust-benchmark.ps1](/bin/micro-adjust-benchmark.ps1) szkript használható.

### 5.40.1 Maga a Timer Resolution beállítása

- Töltsd le a [SetTimerResolution](https://github.com/valleyofdoom/TimerResolution/releases)-t a ``C:\`` meghajtóba majd pedig menje be ``shell:startup``-ba -> Jobb klikk -> Create a shortcut és keresd ki az exe-t.

- Használd az alábbi példát és add hozzá a shortcut-hoz a paramétereket.

  - ``5000 = 0.5ms``, ``5250 = 0.525ms`` stb.


```bat
C:\SetTimerResolution.exe --resolution 5000 --no-console
```

## 5.41 Paging File

Legtöbb esetben ajánlott bekapcsolva hagyni, ami az alap beállítás. Van egy érv, hogy jobb, ha kikapcsolod abban az esetben ha elég RAM-al rendelkezel a játékhoz mivel csökkenti az I/O overhead-et és a rendszermemória gyorsabb mint a disk, azonban FPS drop-okat eredményezhet akkor is ha a memória kihasználtsága közel sem éri el a 100%-ot.

- **Win+R -> sysdm.cpl -> Advanced -> A Performance szekciónál Settings -> Advanced -> A Virtual Memory alatt Change -> Pipáld ki az "Automatically manage paging file size for all drives -> Válaszd ki a No paging file-t -> Set


## 5.42 Cleanup és karbantartás

- Használj programokat mint a [BulkCrapUninstaller](https://github.com/Klocman/Bulk-Crap-Uninstaller) mivel a control panel-ban történő uninstall során sok fájl letörlése kimaradhat.

- Használj [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)-t hogy letiltsd a nem kívánt programok automatikus futtatását. Ellenőrizd gyakran, főleg egy program feltelepítése után. 

- Disk Cleanup

  - Nyisd meg a CMD-t és másold be az alábbi parancsot, pipálj be mindent kivéve a ``DirectX Shader Cache``-t és ``OK``.

    ```bat
    cleanmgr /sageset:0
    ```  

  - Futtasd magát a cleanup-ot

    ```bat
    cleanmgr /sagerun:0
    ```

- Helyek ahol érdemes ellenőrizni a nem kívánt fájlokat

  - ``C:\``
  - ``C:\Windows\Prefetch`` - prefetch fájlok (ennek a mappának üresnek kell lennie a ha a superfetch kivan kapcsolva)
  - ``C:\Windows\SoftwareDistribution`` - Windows Update cache
  - ``C:\Windows\Temp``- ideiglenes fájlok
  - ``%userprofile%``
  - ``%userprofile%\AppData\Local\Temp`` - ideiglenes fájlok
  - Felhasználói directory-k (Downloads, Documents, stb.)

- Opcionálisan tisztítsd a WinSxS mappát az alábbi parancssal. Ez egy hosszabb folyamat lehet.

  ```bat
  DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
  ```

- Opcionálisan töröld ki a System Restore Point-okat. ``Win+R -> sysdm.cpl``. Ajánlott teljesen kikapcsolni.

