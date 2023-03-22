## This file is a quick tutorial on writing CMakeLists for targeting the Vita
cmake_minimum_required(VERSION 2.8)

## This includes the Vita toolchain, must go before project definition
# It is a convenience so you do not have to type
# -DCMAKE_TOOLCHAIN_FILE=$VITASDK/share/vita.toolchain.cmake for cmake. It is
# highly recommended that you include this block for all projects.
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  if(DEFINED ENV{VITASDK})
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VITASDK}/share/vita.toolchain.cmake" CACHE PATH "toolchain file")
  else()
    message(FATAL_ERROR "Please define VITASDK to point to your SDK path!")
  endif()
endif()

## Define project parameters here
# Name of the project
project(petrobots)
# This line adds Vita helper macros, must go after project definition in order
# to build Vita specific artifacts (self/vpk).
include("${VITASDK}/share/vita.cmake" REQUIRED)

## Configuration options for this app
# Display name (under bubble in LiveArea)
set(VITA_APP_NAME "Attack of the PETSCII Robots")
# Unique ID must be exactly 9 characters. Recommended: XXXXYYYYY where X =
# unique string of developer and Y = a unique number for this app
set(VITA_TITLEID  "PETR00001")
# Optional version string to show in LiveArea's more info screen
set(VITA_VERSION  "01.00")

## Flags and includes for building
# Note that we make sure not to overwrite previous flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fsigned-char -DPLATFORM_NAME=\\\"vita\\\" -DPLATFORM_SCREEN_WIDTH=480 -DPLATFORM_SCREEN_HEIGHT=272 -DPLATFORM_MAP_WINDOW_TILES_WIDTH=18 -DPLATFORM_MAP_WINDOW_TILES_HEIGHT=10 -DPLATFORM_INTRO_OPTIONS=3 -DPLATFORM_DEFAULT_CONTROL=2 -DPLATFORM_MODULE_BASED_AUDIO -DPLATFORM_TILE_BASED_RENDERING -DPLATFORM_IMAGE_BASED_TILES -DPLATFORM_IMAGE_SUPPORT -DPLATFORM_SPRITE_SUPPORT -DPLATFORM_COLOR_SUPPORT -DPLATFORM_CURSOR_SUPPORT -DPLATFORM_CURSOR_SHAPE_SUPPORT -DPLATFORM_FADE_SUPPORT -DPLATFORM_LIVE_MAP_SUPPORT -DOPTIMIZED_MAP_RENDERING")
set(CMAKE_EXE_LINKER_FLAGS  "-pthread")
# Optional. You can specify more param.sfo flags this way.
set(VITA_MKSFOEX_FLAGS "${VITA_MKSFOEX_FLAGS} -d PARENTAL_LEVEL=1")

# Add any additional include paths here
include_directories(
  
)

# Add any additional library paths here
# ${CMAKE_CURRENT_BINARY_DIR} lets you use any library currently being built
link_directories(
  ${CMAKE_CURRENT_BINARY_DIR}
)

## Build and link
# Add all the files needed to compile here
add_executable(${PROJECT_NAME}
  petrobots.cpp Platform.cpp PlatformVita.cpp PT2.3A_replay_cia.cpp
)

# Library to link to (drop the -l prefix). This will mostly be stubs.
target_link_libraries(${PROJECT_NAME}
  SDL2
  SDL2_image
  SceGxm_stub
  SceCommonDialog_stub
  SceDisplay_stub
  SceAudioIn_stub
  SceAudio_stub
  SceCtrl_stub
  SceMotion_stub
  SceHid_stub
  SceTouch_stub
  jpeg
  png
  webp
  z
)

## Create Vita files
vita_create_self(${PROJECT_NAME}.self ${PROJECT_NAME})
# The FILE directive lets you add additional files to the VPK, the syntax is
# FILE src_path dst_path_in_vpk. In this case, we add the LiveArea paths.
vita_create_vpk(${PROJECT_NAME}.vpk ${VITA_TITLEID} ${PROJECT_NAME}.self
  VERSION ${VITA_VERSION}
  NAME ${VITA_APP_NAME}
  FILE sce_sys/icon0.png sce_sys/icon0.png
  FILE sce_sys/livearea/contents/bg.png sce_sys/livearea/contents/bg.png
  FILE sce_sys/livearea/contents/startup.png sce_sys/livearea/contents/startup.png
  FILE sce_sys/livearea/contents/template.xml sce_sys/livearea/contents/template.xml
  FILE SDL/animtiles.png animtiles.png
  FILE SDL/c64font.png c64font.png
  FILE SDL/faces.png faces.png
  FILE SDL/gameover.png gameover.png
  FILE SDL/gamescreen.png gamescreen.png
  FILE SDL/health.png health.png
  FILE SDL/introscreen.png introscreen.png
  FILE SDL/items.png items.png
  FILE SDL/keys.png keys.png
  FILE SDL/level-a level-a
  FILE SDL/level-b level-b
  FILE SDL/level-c level-c
  FILE SDL/level-d level-d
  FILE SDL/level-e level-e
  FILE SDL/level-f level-f
  FILE SDL/level-g level-g
  FILE SDL/level-h level-h
  FILE SDL/level-i level-i
  FILE SDL/level-j level-j
  FILE SDL/level-k level-k
  FILE SDL/level-l level-l
  FILE SDL/level-m level-m
  FILE SDL/level-n level-n
  FILE SDL/petfont.png petfont.png
  FILE SDL/sprites.png sprites.png
  FILE SDL/spritesalpha.png spritesalpha.png
  FILE SDL/spritesmask.png spritesmask.png
  FILE SDL/tiles.png tiles.png
  FILE SDL/tilesalpha.png tilesalpha.png
  FILE Music/mod.get-psyched mod.get-psyched
  FILE Music/mod.lose mod.lose
  FILE Music/mod.metal-heads mod.metal-heads
  FILE Music/mod.metallic-bop-amiga mod.metallic-bop-amiga
  FILE Music/mod.robot-attack mod.robot-attack
  FILE Music/mod.rushin-in mod.rushin-in
  FILE Music/mod.soundfx mod.soundfx
  FILE Music/mod.win mod.win
  FILE Sounds/SOUND_BEEP.raw SOUND_BEEP.raw
  FILE Sounds/SOUND_BEEP2.raw SOUND_BEEP2.raw
  FILE Sounds/SOUND_CYCLE_ITEM.raw SOUND_CYCLE_ITEM.raw
  FILE Sounds/SOUND_CYCLE_WEAPON.raw SOUND_CYCLE_WEAPON.raw
  FILE Sounds/SOUND_DOOR_FASTER.raw SOUND_DOOR_FASTER.raw
  FILE Sounds/SOUND_EMP.raw SOUND_EMP.raw
  FILE Sounds/SOUND_ERROR.raw SOUND_ERROR.raw
  FILE Sounds/SOUND_FOUND_ITEM.raw SOUND_FOUND_ITEM.raw
  FILE Sounds/SOUND_MAGNET2.raw SOUND_MAGNET2.raw
  FILE Sounds/SOUND_MEDKIT.raw SOUND_MEDKIT.raw
  FILE Sounds/SOUND_MOVE.raw SOUND_MOVE.raw
  FILE Sounds/SOUND_PLASMA_FASTER.raw SOUND_PLASMA_FASTER.raw
  FILE Sounds/SOUND_SHOCK.raw SOUND_SHOCK.raw
  FILE Sounds/sounds_dsbarexp.raw sounds_dsbarexp.raw
  FILE Sounds/sounds_dspistol.raw sounds_dspistol.raw
  FILE tileset.amiga tileset.amiga
)
