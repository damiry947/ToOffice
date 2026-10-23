#!/bin/bash
export WINEPREFIX="$HOME/.local/share/tooffice/prefix"
export WINEARCH=win64

# Если это первый запуск, настраиваем службы совместимости
if [ ! -d "$WINEPREFIX" ]; then
    echo "Инициализация системных служб ToOffice..."
    winecfg /v win10
    
    # Регистрируем наш фоновый сервис в реестре Wine
    wine reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v KeyManagementServiceServer /t REG_SZ /d 127.0.0.1 /f
fi

# Запуск оригинального бинарника Microsoft Word 2021 Professional Plus
wine "$WINEPREFIX/drive_c/Program Files/Microsoft Office/Office16/WINWORD.EXE" "$@"

