#!/bin/bash

echo "=== Сборка пакета ToOffice для Linux Mint ==="

# Выставляем жесткие системные права доступа внутри папки tooffice-pkg
chmod +x tooffice-pkg/usr/bin/tooffice
chmod +x tooffice-pkg/usr/bin/tooffice-kms

# Если ты уже скачал и положил бинарник vlmcsd туда, раскомментируй следующую строчку:
# chmod +x tooffice-pkg/usr/bin/vlmcsd

# Выставляем права на файл управления внутри папки пакета
chmod 755 tooffice-pkg/DEBIAN/control

# Собираем DEB-пакет именно из папки tooffice-pkg
dpkg-deb --build tooffice-pkg tooffice.deb

echo "=== Сборка завершена! Файл tooffice.deb готов ==="

