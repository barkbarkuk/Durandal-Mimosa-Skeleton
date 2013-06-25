@echo off

if "%1"=="" goto start
if "%1"=="start" goto start
if "%1"=="startd" goto startd
if "%1"=="build" goto build
if "%1"=="build-opt" goto buildo
if "%1"=="buildo" goto buildo
if "%1"=="clean" goto clean
if "%1"=="pack" goto package
if "%1"=="package" goto package

echo make: *** No rule to make target `%1'.  Stop.
goto exit

:start
    echo [x] Building assets and starting development server...
    mimosa watch -s
    goto exit

:startd
    echo [x] Cleaning compiled directory, building assets and starting development server..
    mimosa watch -sd
    goto exit

:build
    echo [x] Building assets...
    mimosa build
    goto exit

:buildo
    echo [x] Building and optimizing assets...
    mimosa build -o
    goto exit

:clean
    echo [x] Removing compiled files...
    mimosa clean
    goto exit

:pack
    echo [x] Building and packaging application...
    mimosa build -omp
    goto exit

:exit