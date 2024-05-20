@echo off

:: Запрос исходного каталога
set /p SOURCE_DIR=Enter the source directory: 

:: Запрос целевого каталога
set /p DESTINATION_DIR=Enter the destination directory: 

:: Проверка существования исходного каталога
if not exist "%SOURCE_DIR%" (
    echo Source directory does not exist: %SOURCE_DIR%
    exit /b 1
)

:: Создание целевого каталога, если он не существует
if not exist "%DESTINATION_DIR%" (
    mkdir "%DESTINATION_DIR%"
)

:: Перемещение файлов
move "%SOURCE_DIR%\*.*" "%DESTINATION_DIR%"

:: Проверка кода завершения операции перемещения файлов
if %errorlevel% equ 0 (
    echo Files successfully moved.
    exit /b 0
) else (
    echo Error moving files.
    exit /b 1
)