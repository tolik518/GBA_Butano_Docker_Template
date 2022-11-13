# GBA Butano Docker Template

## What is this?
This is a template so you can start developing GameBoy Advance games without the need of localy installing [devkitPro](https://devkitpro.org/), [butano](https://github.com/GValiente/butano) or any other dependencies. The only thing you'll need is [docker](https://www.docker.com/get-started/) and `make`, which many developers already have and you'll need a [GameBoy Advance emulator](https://www.addictivetips.com/ubuntu-linux-tips/play-nintendo-gameboy-games-on-linux/#:~:text=The%20VisualBoy%20Advance%20Emulation%20tool,Color%20and%20the%20Gameboy%20Advance.) to fire up the game ([mGBA](https://github.com/mgba-emu/mgba) recommended).

There is also a workflow-script included to compile a gba file after every push and releasing an artifact which could be used for nightly builds.
______________
## How to Start Development (on Linux)
* prerequisites: get [docker](https://www.docker.com/get-started/) and [docker-compose](https://docs.docker.com/compose/install/)
* clone repository
* go to the root of the repository
* build docker image with `make build_image`
* `make get_template`
* optional: get include files with `make getincludes` (`make deleteincludes` to remove them)
* recommended: install c++ 20
Ubuntu example:
    ```
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt install gcc-10 gcc-10-base gcc-10-doc g++-10
    sudo apt install libstdc++-10-dev libstdc++-10-doc
    ```

* recommended: install [mGBA](https://github.com/mgba-emu/mgba)

______________
## How to Start Development (on Windows)
[please add this part]
______________
## How to Start the Game
* use `make compile` to compile the source (you'll find it in the /out folder)
* or use `make run` to compile and run the compiled game
    * probably needs to be configured for your emulator in case you use an other than `mgba-qt`


______________

###### Repository originally maintained by [tolik518](https://github.com/tolik518).
