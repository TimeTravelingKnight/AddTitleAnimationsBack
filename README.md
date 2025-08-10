# BN3 Improved Titlescreens v1.0

This hack intends to improve the Battle Network 3 american titlescreens. It will put back the Parallax and the Spinning Logo animations that Capcom USA removed (presumably to save cartridge space, as putting them back in extends the ROM size beyond 8 MB even though the animations are compressed). It also adds two alternate titlescreens resembling the style of the original japanese ones.

## Features

- Adds the Parallax and Spinning Logo animations back in from the Japanese versions.
- Modifies the position of the logo and added the japanese circular belt to make proper use of the spinning logo and parallax animations.
- Adds two alternate titlescreens, one resembling the japanese orange one and other the dark green with "Black" subtitle. These are optional and users can choose them if they want.

## Source

Source is included in this folder. It users [armips-lzss](https://github.com/leomontenegro6/armips-lzss) to compile, which is based on v0.11.0 with the addition of compressing data on-the-go. It also uses [PixelPet](https://github.com/Prof9/PixelPet) to generate new tilesets/tilemaps/palettes of each titlescreen, and [flips](https://www.romhacking.net/utilities/1040/) to create the IPS patches.

To build it from source, use the following instructions:

1. Get both the MMBN3 White and Blue american roms, rename them to "bn3white.gba" and "bn3blue.gba" and copy them to the repository folder.
2. Run `pixelpet_repack.bat` to regenerate the the tilesets and tilemaps based on the PNG stub files.
3. Run the "build.bat" command, with either of the parameter combinations below. The -w and -b is for specifying White or Blue versions, and the optional -a is to specify the application of the alternate titlescreens.
```bat
.\build.bat -w
.\build.bat -b
.\build.bat -w -a
.\build.bat -b -a
```
4. Check if the "patchedbn3white.gba" or "patchedbn3blue.gba" files were generated.
5. Optionally, use our "test.bat" file to testing it in an emulator of your choice. To do that, create a copy of ".env.example" file and rename it to ".env", and add the relative path of the executable of each emulator. The default one is mGBA.
```bat
.\test.bat w
.\test.bat b
.\test.bat w nocash
.\test.bat b nocash
```
6. Optionally, use our "create_patches.bat" file to create IPS patches by comparing the original and modified ROMs.

## Credits

- TTK: ASM code that brings back the missing japanese animations.
- Mary Wolf: Original art.
- Solid One: Porting/creation of the four titlescreen variants.
- Prof. 9: Support.