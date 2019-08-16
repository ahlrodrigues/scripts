#!/bin/bash
# pegar url ultimo .deb pelo Packages do debian
urllastdeb="$(wget -q -O - https://repo.skype.com/deb/dists/stable/main/binary-amd64/Packages | grep -E "Filename: p"  | tail -n 1 | sed s'@Filename: @https://repo.skype.com/deb/@'g)"
