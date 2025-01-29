# PC-Tuning guideline magyarul
 
## Tartalomjegyzék 

- [1. Physical Setup](#1-physical-setup)
  - [1.1 General](#11-general)
  - [1.2 Hűtés](#12-hűtés)
  - [1.3 Perifériák konfigurálása](#13-perifériák-konfigurálása)
  - [1.4 EMI minimalizálása](#14-emi-minimalizálása)
  - [1.5 USB Portok elrendezésének konfigurálása](#15-usb-portok-elrendezésének-konfigurálása)
- [2. BIOS](#2-bios) 
- [3. Stabilitás, hangolás és hőfokok](#3-stabilitás-hangolás-és-hőfokok) 
- [. Pre Install](#4-pre-install)
- [. Post Install](#-post-install)


## Bemutató

Ezen útmutató célja a Windows-alapú rendszerek finomhangolása, beleértve a hardver-, operációs rendszer- és szoftverkonfigurációkat. Az útmutatás széleskörű célok elérésére van kialakítva, beleértve a biztonság javítása, azonban általában a competitive játékokban való előny megszerzésére és valós idejű feladatok futtatására van kihegyezve. Hangsúlyt fektet arra hogy a felhasználók saját maguk végezzék el a beállításokat és minimalizálja a scriptek használatát annak érdekében hogy átláthatóbb legyen és kerüljék a nem kívánt módosításokat. A szekciókat sorrendben kell követni mivel az egyes lépések a korábbi lépések befejezésétől függnek, ezért minden szekció számozott.

> [!CAUTION]
Hardver > BIOS > Operációs rendszer

> [!CAUTION]
**NE** alkalmazz random, ismeretlen vagy nem dokumentált beállítást, programot vagy scriptet anélkül hogy megértenéd az adott beállítás hatását a biztonságra, adatvédelemre és a teljesítményre.


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

  - [Példa](/assets/images/hwinfo-pcie-width-speed.png)

- A nem P-State 0-ra korlátozott GPU-k esetében a kapcsolat sebessége csökkenhet miközben nincs terhelve. Ellenőrizd a [GPU-Z](https://www.techpowerup.com/gpuz/) programban a beépített renderelési teszt segítségével.

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

- "EMI", azaz "Elektromágneses interferencia" olyan zavaró jeleket vagy zajt jelent, amelyeket elektromágneses mezők okoznak. Ezek a zavarok általában más elektronikai eszközökből vagy külső forrásokból származnak, és befolyásolhatják az elektronikai berendezések működését. Az EMI problémák gyakran akkor merülnek fel, amikor az elektronikai berendezések közel vannak egymáshoz vagy erős elektromágneses mezők vannak jelen, pl. nagyfeszültségű vezetékek, modemek, vagy vezeték nélküli eszközök.

- Az ilyen "problémás" eszközöket, például mobiltelefonokat (airplane mode is egy megoldás), routereket stb. tedd messzebb a setuptól.

- Gondoskodj arról, hogy a kábelek között mérsékelt távolság legyen a "coupling" kockázatának csökkentése érdekében. Ez akkor fordul elő amikor két vagy több kábel túl közel van egymáshoz, és az elektromos jelek áttérnek az egyik vezetékről a másikra, ami interferenciához vezet.

- Használd vezetékesen a perifériáid.

- Húzd ki az alaplapból a felesleges eszközöket, perifériákat, mint például LED-ek, RGB, előlapi csatlakozók, nem használt HDD-k.

- Ethernet kábel vásárlásnál ajánlatos "shielded", vagy "árnyékolt" kábelt venni mivel ezek olyan kialakítással rendelkeznek ami segít kizárni a zavaró jeleket, amelyek befolyásholhatják a hálózati adatvitelt.

## 1.5 USB portok elrendezésének konfigurálása

- Használd a kívánt XHCI-controller első néhány portját. Előfordulhat, hogy némelyikük fizikailag nem megállapítható, amit az [USB Device Tree Viewer](https://www.uwe-sieber.de/usbtreeview_e.html) programban megnézhetsz.
  - A Ryzen-es rendszerek rendelkeznek egy XHCI-vezérlővel, amely közvetlenül a CPU-hoz csatlakozik. Ez [HWiNFO](https://www.hwinfo.com/)-ban a ``PCIe Bus`` kategóriában azonosítható.       

- Ha egynél több XHCI-controller-ed van, akkor az olyan eszközöket, mint például az egér, billentyűzet, és fejhallgató, egy másik controller-re különítheted el, hogy azok ne zavarják a polling konzisztenciáját.

# 2. BIOS

> [!CAUTION] 
Fontos, hogy a módosított beállítások valóban pozítívan befolyásolják a teljesítményt és jegyezd fel őket valahova hogy a jövőben könnyebben megoldj egy felmerülő problémát. Mielőtt belekezdesz ajánlott hogy állítsd alaphelyzetbe a BIOS-t hogy tiszta lappal indulj ha esetleg valami rosszul volt beállítva.

>[!CAUTION]
Szintén fontos hogy a BIOS módosítása mindig kockázattal jár, ezért körültekintően folytasd.

- Ellenőrizd hogy van e frissebb BIOS és hogy van e pozitív változás, mint például stabilabb memória, azonban figyelj oda a fórumokon felvetett problémákra az adott BIOS verzióval kapcsolatban.

  - Frissítés útán győződj meg róla, hogy a Spectre, Meltdown és CPU Microcode státusza rendben van magán az operációs rendszeren. Ha problémába ütköznél akkor lehet, hogy BIOS szinten kell visszaállítanod a CPU Microcode-ot.

  - Ha a CMOS reset nem állítja teljes mértékben vissza alaphelyzetbe a BIOS-t, használd az USB Flashback funkciót.

- Resizable BAR

  - ``Above 4G Encoding`` engedélyezése szükséges a működéséhez

  - Csak RTX 3000 és annál újabb GPU-kon támogatott.

  - Ellenőrizd a Resizable BAR státuszát [GPU-Z](https://www.techpowerup.com/gpuz)-ben.

- Számos alaplap gyártó elrejt sok hasznos beállítást. 
  - A legegyszerűbb megoldás erre az hogy az UEFI-ben lévő összes látható beállítást konfigurálod majd pedig [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-ben a maradék rejtett beállítással folytatod.

- Kapcsold ki a [Hyper-Threading/Simultaneous Multithreading](https://en.wikipedia.org/wiki/Hyper-threading) funkciót, mivel a CPU-nkénti több végrehajtó thread használtata növeli a processzor erőforrásainak igénybevételét, és a rendszer nagyobb latencyjének, és jitterének potenciális forrása. Ha elegendő CPU-val rendelkezel a játék futtatásához, mindenféleképpen kapcsold ki. Ez a koncepció alkalmazható az Intel E-coreok esetében is.

- Kapcsold ki a C-States-eket. 
  
  - Ellenőrizd [HWiNFO](https://www.hwinfo.com/)-ban

- Kapcsold ki a Virtualization/SVM Mode, Intel VT-d/AMD-Vi beállításokat, mivel ezek a memória hozzáférés késeltetését növelhetik. A Virtualization szintén hatással lehet a BCLK-ra.
   
  - Ellenőrizd a Virtualization-t Task Manager-ben.

- Kapcsold ki az összes nem használt eszközt, mint például nem használt NIC-ek, Bluetooth, WiFi, High Definition Audio (ha nem használsz alaplap audio-t), iGPU, SATA és RAM slotok.

- Kapcsold ki a Trusted Platform Module-t. (Windows 11-en pár Anti-Cheat működéséhez szükséges a bekapcsolva hagyása, pl Vanguard, FACEIT).

- Kapcsold ki az összes Power Saving funkciót, mint például: ASPM (Active State Power Management), ALPM (Aggressive Link Power Managemenet), DRAM Power Down, Hibernation, Clock Gating. Keresd a "power management", "power saving" kifejezéseket.

- Kapcsold ki a Secure Boot-ot. (Windows 11-en, a Vanguard, FACEIT, igényli a bekapcsolva hagyását.)

- Kapcsold ki a Fast Startup/Fast Boot/Memory Fast Boot funkciót.

- Kapcsold ki a Spread Spectrumot és győződj meg róla hogy a BCLK frequency kereken 100.000 és nem Auto. [HWiNFO](https://www.hwinfo.com/)/[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)-ben ellenőrizni tudod.

- PCIe Link Speed-et tedd a lehető legmagasabbra, mint például Gen 3, stb. Sose hagyd Auto-n.
  
  - Keresd a ``PCIe Speed``, ``Gen3`` kifejezéseket hogy megtaláld az adott beállítást [SCEWIN](https://github.com/ab3lkaizen/SCEHUB)-ben.

- Ha statikus frekvenciát/feszültséget konfigurálsz a CPU-hoz, kapcsold ki a dynamic frequency funkciókat mint például a Speed shift, speedstep, és állítsd az AVX offsetet 0-ra, vagy tedd ``Disabled``-re. Precision Boost Overdrive (PBO) a Ryzen CPU-k esetében a statikus frekvencia és feszültésg alternatívája (X3D kivétel).

  - Egyes esetekben a fent említett beállítások megakadályozhatják, hogy a processzor a BIOS-ban történő manuális beállítás ellenére is túllépje az alapfrekvenciát. Ennek megfelelően állítsd be, ha ez előfordul, és [HWiNFO](https://www.hwinfo.com/)-ban ellnőrizd az órajeleket.

- Konfiguráld a fan speedeket, állíts be egy statikus, magas RPM-et.

- Kapcsold be a High Precision Event Timer-t. 
  
  - Újabb AMD rendszereken nincs hatása ennek a beállításnak.

- Kapcsold ki a Legacy USB Support-ot. Lehetséges hogy be kell kapcsolnod hogy új operációs rendszert telepíts fel vagy hogy hozzáférj a BIOS-hoz.

- Kapcsold ki az XHCI Hand-off-ot.

- Kapcsold ki az Execute Disable Bit/NX Mode-ot. Néhány applikáció (FACEIT, Valorant) igényli a bekapcsolva hagyását.

- Mentsd le a jelenlegi BIOS profilodat hogyha valamilyen oknál fogva alaphelyzetbe kell állítani akkor ne kelljen előről kezdened az egészet.

# 3. Stabilitás, hangolás és hőfokok







