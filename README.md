# PETSCIIRobots-Vita
Playstation Vita port of Attack of the PETSCII Robots based on SDL port by Vesa Halttunen <vesuri@jormas.com>
Currently unfinished (mainly controls don't work and there's a bug with player changing sprites), and without proper graphics for LiveArea.
## Building
Tested only with Ubuntu, but it should work on any OS that VitaSDK will run on.
1. Install [VitaSDK](https://vitasdk.org/), CMake, and git. 
3. Using `vdpm` install `SDL2`, `SDL2_image`, `libpng`, `libwebp` and `libjpeg-turbo`.
4. Clone this repository with `git clone https://github.com/nolemretaWxd/PETSCIIRobots-Vita.git`
5. Build the project using CMake (eg. `cmake .` to generate Makefile, then `make` to build

Resulting .vpk file should run on any [HENkaku](https://henkaku.xyz/) modded Vita, and on Vita3K emulator.
