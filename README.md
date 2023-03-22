# Attack of the PETSCII Robots PlayStation Vita
PlayStation Vita port by Vesa Halttunen <vesuri@jormas.com> and nolemretaW <contact@nolemretaw.pl>

This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

## Building
Tested only with Ubuntu, but it should work on any OS that VitaSDK will run on.
1. Install [VitaSDK](https://vitasdk.org/), CMake, and git. 
2. Using `vdpm` install `SDL2`, `SDL2_image`, `libpng`, `libwebp` and `libjpeg-turbo`.
3. Clone this repository with `git clone https://github.com/nolemretaWxd/PETSCIIRobots-Vita.git`
4. Build the project using CMake (eg. `cmake .` to generate Makefile, then `make` to build

Resulting .vpk file should run on any [HENkaku](https://henkaku.xyz/) modded Vita, and on Vita3K emulator.

## Controls
- UP/DOWN/LEFT/RIGHT move
- TRIANGLE/CROSS/SQUARE/CIRCLE fire
- L search
- R move
- START use item
- SELECT+L cycle item
- SELECT+R cycle weapon
- SELECT+LEFT live map
- SELECT+DOWN live map robots
- SELECT+CIRCLE pause
- SELECT+CROSS toggle music
