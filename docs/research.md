# Research

--- 

## 1. Hány RSS Queue-ra van szükséged? 

Az RSS egy olyan hálózati technológia, amely lehetővé teszi a hálózati interruptok/DPC-k hatékony elosztását több CPU között. Az, hogy mekkora RSS Queue-t kell használni, illetve mennyire van szükség, a tipikus hálózati terheléstől függ. Server környezetekben a nagy mennyiségű RSS-Queue-k használata előnyös, mivel a processing delay csökken, és biztosítja, hogy egyetlen CPU-t sem terheli nagymértékben. Ugyanez a koncepció alkalmazható egy gaming gépre is, azonban a hálózati terhelés jelentősen különbözik, így az összehasonlítás érvénytelen, ezért úgy döntöttem, hogy elvégzek néhány kísérletet, hogy ésszerű következtetést vonjak le.

Két gépen szimuláltam a Valorant hálózati forgalmát iperf-ben (~300kb/s receive deathmatch-ben), és figyeltem a hálózati eszköz aktivitását xperf-ben. Vegyük figyelembe, hogy az ``RssBaseProcessor`` 0-ra van állítva, így elméletileg a CPU 0 és CPU 1 kellene, hogy kezelje a DPC-ket/ISR-eket a NIC számára, mivel 2 RSS Queue van beállítva.

<img src="/media/300kbps-ndis-xperf-report.png" width="500">

Észrevehető hogy a 2 RSS Queue beállítás ellenére is, legfőképp a CPU 1 kezeli az interruptokat ami valószínűleg a kevés network traffic miatt van. Ezért ugyanazokkal a beállításokkal, most 1Gpbs network trafick-al újrateszteltem. 

<img src="/media/1gbps-ndis-xperf-report.png" width="500">

Ahogy várható volt, ebben a helyzetben a CPU 0 és CPU 1 is használatban van. 

Összegzés: Online meccsek alatt, maximum 2 CPU van használatban. Azonban nem árt ha több RSS Queue van konfigurálva, de fontos hogy tisztában legyünk a fenti információkkal mivel az emberek kifejezetten a Network Adapter-nek tartanak fent CPU-kat, amikor azokat egy másik driver jobban ki tudná használni.

## 2. Identity Scaling

Identity scaling, vagy `real no scaling` az a beállítás amit a [SetDisplayConfig](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setdisplayconfig) használ amikor az asztal és a monitor felbontása azonos. 

A GPU control panelban lévő scaling mode beállítás egy bizonyos registry key-t változtat ([1](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ne-wingdi-displayconfig_scaling)).
Az alábbi sorok megmutatják hogy a GPU control panel-ban lévő beállítások melyik registry key-re válaszolnak.

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Configuration\<id>]
"Scaling"=dword:00000002
```

```cpp
typedef enum {
    DISPLAYCONFIG_SCALING_IDENTITY = 1,
    DISPLAYCONFIG_SCALING_CENTERED = 2, // No scaling
    DISPLAYCONFIG_SCALING_STRETCHED = 3, // Full-screen
    DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX = 4, // Aspect ratio
    DISPLAYCONFIG_SCALING_CUSTOM = 5,
    DISPLAYCONFIG_SCALING_PREFERRED = 128,
    DISPLAYCONFIG_SCALING_FORCE_UINT32 = 0xFFFFFFFF
} DISPLAYCONFIG_SCALING;
```

Ahogy látható, nincs olyan beállítás a GPU control panel-ban ami a ``DISPLAYCONFIG_SCALING_IDENTITY-nek felel meg. Következésképpen az emberek ahhoz folyamodtak, hogy a Scaling értéket manuálisan 1-re változtatják a registry editorban, és azt állítják, hogy érzékelik a különbséget, de ez identity scaling-re állítja a Scaling módot? Egyáltalán működik-e az érték megváltoztatása, ha a natív felbontást használják? Nem az identity scaling mód van használatban automatikusan ha a natív felbontást használod? Milyen egyéb tényezők határozzák meg a scaling modeot? Végül is a Microsoft azt állítja, hogy ez a registry key csak  egy request arra, hogy milyen scaling mód legyen használatban, ezért nem feltétlenül jelenti azt, hogy valójában ez lesz használatban. 

Az összes fenti kérdés megválaszolható a [QueryDisplayConfig](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-querydisplayconfig) lekérésével. Használd a [QueryDisplayScaling](https://github.com/valleyofdoom/QueryDisplayScaling) programot. Töltsd le majd pedig nyisd meg a CMD-t abban a directory-ban ahol található az exe majd pedig írd be hogy ``QueryDisplayScaling.exe``.

```
PS C:\> .\QueryDisplayScaling.exe
Scaling Mode: 1
```

<table style="text-align: center;">
    <tr>
        <td rowspan="2">Peform Scaling On</td>
        <td rowspan="2">Requested Scaling Mode</td>
        <td colspan="3">Actual Scaling Mode</td>
    </tr>
    <tr>
        <td>Native (1920x1080)</td>
        <td>GPU Control Panel (1280x720)</td>
        <td>CRU (1280x720)</td>
    </tr>
    <tr>
        <td rowspan=4>GPU</td>
        <td>Identity (1)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>No scaling (2)</td>
        <td>Identity (1)</td>
        <td>Centered (2)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td rowspan=4>Display</td>
        <td>Identity (1)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>No scaling (2)</td>
        <td>Identity (1)</td>
        <td>Centred (2)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
        <td>Full-screen (3)</td>
        <td>Identity (1)</td>
    </tr>
    <tr>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
        <td>Aspect ratio (4)</td>
        <td>Identity (1)</td>
    </tr>
</table>

## 3. DiscordFixer

A Discord a hotkey-ek (Mute, Deafen, stb) használatához abban az esetben is leköveti az egér mozgását (raw_input thread) amikor nincs előtérben a Discord ezáltal jóval több értelmetlen context switching-et és cycles-t eredményez ([1](/media/discordfixer-research-example.png)). A DiscordFixer automatikusan leállítja a raw_input thread host folyamatát azonban a hotkey funkciók nem lesznek elérhetők és az én esetemben nem ismeri fel a Discord az éppen futó játékot. Lásd a DiscordFixer GitHub repo-ját a használati útmutatóért.

Ha azt szeretnéd hogy automatikusan DiscordFixer-en keresztül induljon el minden gép indításnál, csinálj egy shortcut-ot ``shell:startup``-ba.