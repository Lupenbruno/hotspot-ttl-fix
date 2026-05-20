@echo off
title TTL 65 Ayarlayici
:: --- Yonetici izni kontrolu / otomatik yukseltme ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Yonetici izni gerekiyor, yeniden baslatiliyor...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo ============================================
echo   TTL degeri 65 olarak ayarlaniyor
echo ============================================
echo.

:: IPv4
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 65 /f >nul
echo [OK] IPv4 DefaultTTL = 65

:: IPv6
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DefaultTTL /t REG_DWORD /d 65 /f >nul
echo [OK] IPv6 DefaultTTL = 65

echo.
echo --------------------------------------------
echo  TAMAM. Degisikligin etkili olmasi icin
echo  bilgisayari YENIDEN BASLATMALISIN.
echo --------------------------------------------
echo.
pause
