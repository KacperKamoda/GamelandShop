#!/bin/bash
set -e

echo "--- Build Script Started (Final Version) ---"

echo "Step 1: Installing .NET SDK..."
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 9.0 --install-dir .dotnet
echo ".NET SDK installed."

echo "Step 2: Publishing the .NET solution..."
./.dotnet/dotnet publish GamelandShop.sln -c Release -o output
echo "Solution published."

echo "--- Build Script Finished ---"
