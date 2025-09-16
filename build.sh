#!/bin/bash
set -e

# Krok 1: Instalacja .NET
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 9.0 --install-dir .dotnet
    
# Krok 2: Publikuj TYLKO PROJEKT KLIENCKI Z POPRAWNĄ ŚCIEŻKĄ
./.dotnet/dotnet publish GamelandShop.Web.Client/GamelandShop.Web.Client.csproj -c Release -o output
    
# Krok 3: Skopiuj plik routingu do folderu wyjściowego
cp vercel.json output/wwwroot/
