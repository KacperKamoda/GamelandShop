#!/bin/bash
set -e # Zatrzymaj skrypt, jeśli jakakolwiek komenda zawiedzie

echo "--- Build Script Started (Final Guaranteed Version) ---"

echo "Step 1: Installing .NET SDK..."
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 9.0 --install-dir .dotnet
echo ".NET SDK installed successfully."

echo "Step 2: Publishing the .NET solution..."
# Budujemy całe rozwiązanie, co jest najlepszą praktyką
./.dotnet/dotnet publish GamelandShop.sln -c Release -o output
echo "Solution published successfully."

echo "Step 3: Copying vercel.json to the output directory..."
# TO JEST KLUCZOWY, BRAKUJĄCY KROK
cp vercel.json output/wwwroot/
echo "vercel.json copied successfully."

echo "--- Final content of the output directory (output/wwwroot): ---"
ls -lA output/wwwroot # OSTATECZNY DOWÓD SUKCESU

echo "--- Build Script Finished Successfully ---"
