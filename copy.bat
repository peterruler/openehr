@echo off
cd archetypes_2025_04_21-14_02_51

:: Erstelle das Zielverzeichnis, falls es nicht existiert
if not exist all (
    mkdir all
)

:: Kopiere alle .adl-Dateien rekursiv in das Zielverzeichnis
for /r %%f in (*.adl) do (
    copy "%%f" all\
)