{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.gnome; [
    tali
    ghex
    sushi
    iagno
    gpaste
    cheese
    vinagre
    seahorse
    nautilus
    lightsoff
    aisleriot
    gnome-characters
    gnome-logs
    gnome-mines
    gnome-chess
    file-roller
    quadrapassel
    gnome-taquin
    gnome-sudoku
    four-in-a-row
    gnome-mahjongg
    gnome-bluetooth
    gnome-screenshot
    gnome-calculator
    gnome-disk-utility
  ];
}