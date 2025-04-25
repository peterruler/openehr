#!/bin/bash
cd ./archetypes_2025_04_21-14_02_51
mkdir -p ./all
find . -name "*.adl" -type f -print0 | xargs -0 -I {} cp {} ./all