# BasicEQ

 Audio plugin built with the JUCE Framework. Based on [tutorial](https://www.youtube.com/watch?v=i_Iq4_Kd7Rc)
<!-- https://youtu.be/i_Iq4_Kd7Rc?t=1791 part 7-->
<!-- TO - DO https://github.com/shaduzlabs/audio-plugin-project-template -->

## Requirements

### Linux

- alsa - `libasound2-dev`
- x11, xinerama, and xext - `libxcursor-dev`, `libxinerama-dev` and `libxrandr-dev`
- freetype2 - `libfreetype6-dev`
- webkit2gtk-4.0 - `libwebkit2gtk-4.0-dev`
- gtk+-x11-3.0 - `libgtk-3-dev`
- libcurl - `libcurl4-openssl-dev`

```bash
sudo apt update
sudo apt install libxrandr-dev libxcursor-dev libxinerama-dev libfreetype6-dev libasound2-dev libwebkit2gtk-4.0-dev libgtk-3-dev libcurl4-openssl-dev
```

## Build & Run

```bash
$ ./build.sh -h

Usage: ./build.sh [-c|b|r]

Options:
  -c     Clean the build directory
  -b     Build the program
  -r     Run the program
  -h     Print the help

At least one flag must be specified

Exit Status:
Returns 0 unless an invalid option is given or the current directory cannot be read.
```
