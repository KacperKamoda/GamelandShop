cat <<EOF > build.sh
#!/bin/bash
set -e
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 9.0 --install-dir .dotnet
./.dotnet/dotnet publish GamelandShop.sln -c Release -o output
cp vercel.json output/wwwroot/
EOF
