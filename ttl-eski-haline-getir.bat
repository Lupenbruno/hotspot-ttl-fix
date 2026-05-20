@echo off
title TTL Eski Haline Getir
:: --- Yonetici izni kontrolu / otomatik yukseltme ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Yonetici izni gerekiyor, yeniden baslatiliyor...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo ============================================
echo   TTL varsayilan degere donduruluyor
echo ============================================
echo.

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /f >nul 2>&1
echo [OK] IPv4 DefaultTTL silindi

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DefaultTTL /f >nul 2>&1
echo [OK] IPv6 DefaultTTL silindi

echo.
echo --------------------------------------------
echo  Windows varsayilan TTL (128) degerine
echo  donecek. Bilgisayari YENIDEN BASLAT.
echo --------------------------------------------
echo.
pause
