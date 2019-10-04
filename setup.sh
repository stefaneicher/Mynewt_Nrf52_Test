#!/usr/bin/env bash

#
##https://mynewt.apache.org/latest/newt/install/newt_mac.html
#brew tap JuulLabs-OSS/mynewt
#brew update
#brew install mynewt-newt
#
#brew tap homebrew/cask-drivers
#brew cask install segger-jlink
#
#which newt
#newt version
#
##https://mynewt.apache.org/latest/tutorials/blinky/nRF52.html
newt new Mynewt_Nrf52_Test2
cd Mynewt_Nrf52_Test2
newt upgrade

newt target create nrf52_boot
newt target set nrf52_boot app=@mcuboot/boot/mynewt
newt target set nrf52_boot bsp=@apache-mynewt-core/hw/bsp/nordic_pca10056
newt target set nrf52_boot build_profile=optimized

newt target create nrf52_blinky
newt target set nrf52_blinky app=apps/blinky
newt target set nrf52_blinky bsp=@apache-mynewt-core/hw/bsp/nordic_pca10056
newt target set nrf52_blinky build_profile=debug


newt target show
newt build nrf52_boot
newt build nrf52_blinky
newt create-image nrf52_blinky 1.0.0

newt load nrf52_boot
newt load nrf52_blinky