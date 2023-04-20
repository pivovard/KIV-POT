# KIV/POT
Vyukove materialy k predmetu [KIV/POT](https://courseware.zcu.cz/portal/studium/courseware/kiv/pot).

### Plán cvičení
1. Uvodni cviceni
2. Prace s cisly
3. H8S - pouziti prostredi HEW, zakladni instrukce
4. H8S - simulovane I/O, makra
5. H8S - priklad na prevod cisel
6. H8S - preruseni
7. Dekodovani adres
8. x86 - zakladni instrukce
9. x86 - volani funkci, systemove volani a WinAPI
10. x86 - vektorove instrukce, optimalizace, instrukcni cyklus
11. Zapoctovy test (prace s cisly, dekodovani adres)
12. Konzultacni cviceni, odevzdani SP

(plan cviceni je pouze orientacni a muze se v prubehu semestru menit)

### Navody k prostredi HEW
http://home.zcu.cz/~dudacek/EVB/kpit_gnu_simulator.htm

### Navody pro x86
Nasteveni projektu ve VS:
- Project -> Build Dependencies -> Build Customizations... -> masm
- Project -> Properties -> Custom Build Step -> Command line: **`/DYNAMICBASE:NO`**
- Build -> Configuration Manager -> Platform: x86 (Win32)
- Add new .asm file -> Properties -> Item Type: Microsoft Macro Assembler

Popis x86 architektury: \
https://en.wikibooks.org/wiki/X86_Assembly \
Zakladni instrukce x86: \
https://www.cs.virginia.edu/~evans/cs216/guides/x86.html \
Kompletni instrukcni set: \
https://docs.oracle.com/cd/E18752_01/html/817-5477/enmzx.html \
Volani C procedur \
https://jeffpar.github.io/kbarchive/kb/073/Q73407/

### Ostatni
[Floating point converter](https://www.h-schmidt.net/FloatConverter/IEEE754.html) \
[Video](https://www.youtube.com/watch?v=ExwqNreocpg), jak lze zmensit velikost aplikace za pouziti assembly anebo nastaveni kompilatoru tak, ze se vejde do velmi male pameti jakou ma napriklad QR kod.
