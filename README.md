# PC-Tuning guideline
 
## Tartalomjegyzék 

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
  - [2.19 Legacy USB Support](#219-legacy-usb-support-legacy-usb-support)
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
- [5. Post Install](#-post-install)


## Bemutató

Ezen útmutató célja a Windows-alapú rendszerek finomhangolása, beleértve a hardver-, operációs rendszer- és szoftverkonfigurációkat. Az útmutatás széleskörű célok elérésére van kialakítva, beleértve a biztonság javítása, azonban általában a competitive játékokban való előny megszerzésére és valós idejű feladatok futtatására van kihegyezve. Hangsúlyt fektet arra hogy a felhasználók saját maguk végezzék el a beállításokat és minimalizálják a scriptek használatát annak érdekében hogy átláthatóbb legyen és kerüljék a nem kívánt módosításokat. A szekciókat sorrendben kell követni mivel az egyes lépések a korábbi lépések befejezésétől függnek, ezért minden szekció számozott.

> [!CAUTION]
Hardver > BIOS > Operációs rendszer

> [!CAUTION]
**NE** alkalmazz random, ismeretlen vagy nem dokumentált beállítást, programot vagy scriptet anélkül hogy megértenéd az adott beállítás hatását a biztonságra, adatvédelemre és a teljesítményre.

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

  - [Példa](/assets/hwinfo-pcie-width-speed.png)

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

- ``Win+R`` -> ``control userpasswords`` -> ``Users`` majd jobb klikk az ``Administrator``profilra, ``Set Password`` -> írd be a jelenlegi jelszavad majd töröld ki és hagyd üresen hogy eltávolítsd.

## 5.6 Privacy Options

``Win+I`` -> ``Privacy`` és kapcsolj ki minden nem használt engedélyt.

## 5.7 Search Indexing






