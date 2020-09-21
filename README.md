# DevSound
DevSound is a sound driver for the Game Boy which supports pulse width manipulation, arpeggios, and multiple waveforms. This repository is for a stripped down version more suitable for games and demoes. The full version of DevSound can be found here if you're interested: https://github.com/DevEd2/DevSound

# Building a demo ROM

## Windows
1. Grab the [RGBDS binaries](https://github.com/rednex/rgbds/releases). If you already have them, you can skip this step.
3. Run build.bat. If that doesn't work, try either adding the RGBASM binaries to your PATH or copying them to the repository directory.

## Linux
1. Install [RGBDS](https://github.com/rednex/rgbds). If RGBDS is already installed, skip this step.
3. Run `make`.

# Adding DevSound to your project
1. Copy DevSound.asm, DevSound_Defines.inc and DevSound_SongData.asm to your project directory. If you're not using a file such as [hardware.inc](https://github.com/tobiasvl/hardware.inc) or gbhw.inc, you will need to include it as well.
2. Allocate a ROM bank for DevSound. Make note of the bank number (unless your ROM does not use banking).
3. Add the following line to your main loop: `call DS_Play`
4. In order to load a song, use the following code:
```
ld a,SongID  ; replace SongID with the ID of the song you want to load
call  DS_Init
```
5. In order to stop playback, use the following line of code: `call DS_Stop`

6. If you need help, let me know. I can usually be reached in the [gbdev Discord server](https://discord.gg/gpBxq85). Just ping me (I go by the name DevEd on that server) if you need anything.

# Frequently Asked Questions
*TODO*
