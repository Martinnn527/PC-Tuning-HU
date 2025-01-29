# PC-Tuning guideline magyarul
 
## Tartalomjegyzék 

- [1. Physical Setup](#1-physical-setup)
  - [1.1 General](#11-general)
  - [1.2 Hűtés](#12-hűtés)
  - [1.3 Perifériák beállítása](#13-perifériák-beállítása)
- [Pre Install](#2-pre-install)
- [Post Install](#3-post-install)


## Bemutató

Ezen útmutató célja a Windows-alapú rendszerek finomhangolása, beleértve a hardver-, operációs rendszer- és szoftverkonfigurációkat. Az útmutatás széleskörű célok elérésére van kialakítva, beleértve a biztonság javítása, azonban általában a competitive játékokban való előny megszerzésére és valós idejű feladatok futtatására van kihegyezve. Hangsúlyt fektet arra hogy a felhasználók saját maguk végezzék el a beállításokat és minimalizálja a scriptek használatát annak érdekében hogy átláthatóbb legyen és kerüljék a nem kívánt módosításokat. A szekciókat sorrendben kell követni mivel az egyes lépések a korábbi lépések befejezésétől függnek, ezért minden szekció számozott.

> [!CAUTION]
Hardver > BIOS > Operációs rendszer

> [!CAUTION]
**NE** alkalmazz random, ismeretlen vagy nem dokumentált beállítást, programot vagy scriptet anélkül hogy megértenéd az adott beállítás hatását a biztonságra, adatvédelemre és a teljesítményre.


# 1. Physical Setup

## 1.1 General

- Lehetőleg minden nagyobb alkatrészcsere után telepítsd újra a Windowst (pl alaplap, cpu, stb). Videókártya az egyik kivétel.
- Érdemes vezetékes eszközöket használni, mivel a vezetéknélküli eszközök hajlamasok agresszív energiatakarékosságot alkalmazni a hosszabb akkumulátor élettartam érdekében, a túlzott EMI hátrányaival együtt.
- A CrystalDiskInfo és CrystalDiskMark programmal megtekinthető az SSD állapota. Új meghajtó vásárlásakor ellenőrizd a teljes olvasás/írás értékét hogy megállapítsd, nem e használt.
- Frissítsd az SSD, NIC, és a többi periféria firmware-ét
- Kerüld a single-channel, 2-4 stick esetén pedig az eltérő RAMokat. Érdemes nézni az alaplap útmutatóját, hogy dual channel esetén az 1-3, vagy a 2-4 slotot érdemes-e használni. 
- Használj PCIe portokat amelyek egyenesen a CPU-ba mennek a PCH helyett. Ez jellemzően az M.2 és NVME SSD-kre és a GPU-ra vonatkozik. HWiNFO-ban a PCIe Bus kategóriánál, vagy az alaplapod oldalán lévő manual-ban a PCI részlegnél találod meg a kellő információt.
- Győződj meg róla, hogy a PCIe Bus kategóriába tartozó PCIe eszközök sebessége megegyezik a maximálisan támogatott értékkel.
- A nem P-State 0-ra korlátozott GPU-k esetében a kapcsolat sebessége csökkenhet miközben nincs terhelve. Ellenőrizd a GPU-Z programban a beépített renderelési teszt segítségével
- Ha egynél több beépített Network Controllered van, érdemes azt használni amelyik támogatja az MSI-X-et, mivel ez szükséges az RSS (Receive-Side-Scaling) helyes működéséhez. Ezt a GoInterruptPolicy programban ellenőrizni tudod.
- Ragaszd le a laza kábelek végét, hogy csökkentsd az alkatrészek zárlatának kockázatát.
- Kerüld a feleslegesen hosszú kábelek használatát.
- Gyakran érdemes tisztítani az alkatrészeket és a hűtőbordákat, mivel ha porosak, csökkentik a légáramlást és zárlatot okozhatnak.
- Győzödj meg róla, hogy nincsen IRQ Sharing a rendszeren. Ellenőrizni tudod: Win+R -> msinfo32, rányomsz a Hardware Resources-re, majd a Conflicts/Sharing-re. A "Memory Address"-t  és az I/O Port-ot figyelm kívül hagyhatod.

## 1.2 Hűtés

- Semmiképp se legyen a gép szőnyegen, vagy olyan helyen ahol nincs elegendő légáramlás. Ha mégis arra kerülne a sor, hogy szőnyegre teszed, akkor egy fa lapot tegyél a gépház alá, így hűvösebb felületen lesz, és kevésbé fog porosodni.
- Érdemes a gépházad oldalát levenni a légáramlás segítése érdekében.
- Használj folyékony fémet a CPU-n a jelentős termikus javulás érdekében.
- Ha heatsink nélküli NVME/M.2 SSD-t szerelsz be ügyelj arra hogy az alaplapon lévő thermal pad-ekről leveszed a fóliát.
- Használj nem RGB-s ventilátorokat magas statikus nyomással.
- Cseréld ki a gyári hőszigetelőket jobb minőségűre
- Pasztázd újra a GPU-t.

## 1.3 Perifériák beállítása

- A legtöbb modern periféria támogatja az onboard memory profilet. Állítsd be őket mielőtt újratelepítenéd a windowst, hogy ne kelljen a későbbi módosítások érdekében feltelepíteni a sok bloatware-t.
- Magasabb DPI csökkenti a latency-t. Használj minimum 3200 dpi-t. Ügyelj arra hogy sensor smoothing ne lépjen életbe magasabb DPI használatakor. A windowsban az egér beállítások közt lejjebb viheted a pointer speedet tetszésed szerint ha a játék raw inputot használ.
- Magasabb polling rate csökkenti a jittert. Az 1000Hz-nél magasabb polling rate hardvertől függően negatívan befolyásolhatja a teljesítményt, ezért ennek megfelőlen kell beállítani. Ez nem akkora probléma a 2023 májusi Windows 11 Raw Input Stack update után ami limitálja a nem előtérben lévő programok polling frekvenciáját 125hz-re.
- Az USB kimenet ~7A-ra van korlátozva, és az RGB felesleges energiát igényel. Fontold meg az RGB kikapcsolását, mivel az effektek/animációk nagy terhet tesznek az MCU-ra, és késleltethetik a többi folyamatot. OpenRGB egy jó választás a világítás módosítására.
- MouseTester segítségével ellenőrizheted, hogy az egyes "poll"-ok tartalmaznak-e adatokat. Ha például az intervallum 1ms-ról (1000Hz) 2ms-ra (500Hz) vagy annál magasabbra ugrik, az problémás, és több minden miatt fordulhat elő, mint pl maga az eszköz, energiaellátás, hardver, operációs rendszer. 
- Sűrített levegő segítségével tisztítsd az egér szenzorát.



