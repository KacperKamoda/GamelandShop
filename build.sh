#!/bin/bash
set -e
echo "--- Build Script Started ---"
echo "Step 1: Installing .NET SDK..."
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 9.0 --install-dir .dotnet
echo ".NET SDK installed successfully."
echo "Step 2: Publishing the .NET solution..."
./.dotnet/dotnet publish GamelandShop.sln -c Release -o output
echo "Solution published successfully."
echo "Step 3: Preparing 'public' directory for Vercel..."
mkdir public
cp -r output/wwwroot/* public/
cp vercel.json public/
echo "'public' directory prepared."
echo "--- Final content of 'public' directory: ---"
ls -lA public
echo "--- Build Script Finished Successfully ---"
