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
#newt new Mynewt_Nrf52_Test
#cd Mynewt_Nrf52_Test
#newt upgrade


#Board von Marc
selectedBsp=nordic_pca10056
#selectedBsp=nucleo-f030r8
#selectedBsp=stm32f3discovery


newt target create "${selectedBsp}boot"
newt target set "${selectedBsp}boot" app=@mcuboot/boot/mynewt
newt target set "${selectedBsp}boot" bsp="@apache-mynewt-core/hw/bsp/${selectedBsp}"
newt target set "${selectedBsp}boot" build_profile=optimized

newt target create "${selectedBsp}blinky"
newt target set "${selectedBsp}blinky" app=apps/blinky
newt target set "${selectedBsp}blinky" bsp="@apache-mynewt-core/hw/bsp/${selectedBsp}"
newt target set "${selectedBsp}blinky" build_profile=debug


newt target show
newt build "${selectedBsp}boot"
newt build "${selectedBsp}blinky"
newt create-image "${selectedBsp}blinky" 1.0.0

newt load "${selectedBsp}boot"
newt load "${selectedBsp}blinky"