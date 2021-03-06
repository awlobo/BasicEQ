#!/bin/bash

set -e # Fail in case if any commands fail
set -E # Print errtrace in case of failure
set -T # Print functrace in case of failure

YELLOW_COLOR='\033[1;33m'
RED_COLOR='\033[0;31m'
NO_COLOR='\033[0m'

print_help () {
    echo "Usage: ./build.sh [-c|b|r]"
    echo
    echo "Options:"
    echo "  -c     Clean the build directory"
    echo "  -b     Build the program"
    echo "  -r     Run the program"
    echo "  -h     Print the help"
    echo
    echo "At least one flag must be specified"
    echo
    echo "Exit Status:"
    echo "Returns 0 unless an invalid option is given or the current directory cannot be read."
}

function run_by_os() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)
            if ! [ -f JUCE/extras/AudioPluginHost/Builds/LinuxMakefile/build/AudioPluginHost ]
            then
                echo -e "${YELLOW_COLOR}COMPILING AUDIO PLUGIN HOST - Linux...${NO_COLOR}"
                cd JUCE/extras/AudioPluginHost/Builds/LinuxMakefile
                make
                cd -
            fi
            ./JUCE/extras/AudioPluginHost/Builds/LinuxMakefile/build/AudioPluginHost
            # ./build/BasicEQ_artefacts/Standalone/BasicEQ
        ;;
        Darwin*)
            if ! [ -e JUCE/extras/AudioPluginHost/Builds/MacOSX/build/Debug/AudioPluginHost.app ]
            then
                echo -e "${YELLOW_COLOR}COMPILING AUDIO PLUGIN HOST - macOS...${NO_COLOR}"
                cd JUCE/extras/AudioPluginHost/Builds/MacOSX/
                xcodebuild -scheme "AudioPluginHost - App"  build
                cd -
            fi
            open JUCE/extras/AudioPluginHost/Builds/MacOSX/build/Debug/AudioPluginHost.app
            # ./build/BasicEQ_artefacts/Standalone/BasicEQ.app/Contents/MacOS/BasicEQ
        ;;
        CYGWIN*)    build/BasicEq_artefacts/Debug/Standalone/BasicEq.exe;;
        MINGW*)     build/BasicEq_artefacts/Debug/Standalone/BasicEq.exe;;
        *)          echo "Unsupported OS"
    esac
}

while getopts cbrh opt; do
    case $opt in
        c)  # clean build folder
            echo -e "${YELLOW_COLOR}CLEANING...${NO_COLOR}"
            rm -rv build/ && echo -e "${YELLOW_COLOR}CLEAN SUCCESSFUL...${NO_COLOR}"
        ;;
        b)  #build plugin
            git submodule update --recursive --init --force
            echo -e "${YELLOW_COLOR}BUILDING...${NO_COLOR}"
            cmake . -B build
            cmake --build build
            echo -e "${YELLOW_COLOR}BUILD COMPLETED...${NO_COLOR}"
        ;;
        r)  # run plugin
            echo -e "${YELLOW_COLOR}RUNNING...${NO_COLOR}"
            run_by_os
        ;;
        h)
            print_help
        ;;
        *)  # unknown option
            echo -e "${RED_COLOR}WRONG FLAG"
        ;;
    esac
done

