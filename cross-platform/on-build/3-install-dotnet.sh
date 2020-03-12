#!/usr/bin/env bash
Say "Installing dotnet"; 
curl -ksSL -o /tmp/install-DOTNET.sh https://raw.githubusercontent.com/devizer/test-and-build/master/lab/install-DOTNET.sh; 
export DOTNET_TARGET_DIR=/usr/share/dotnet; 
set +e
bash /tmp/install-DOTNET.sh;
set -e 
ln -f -s ${DOTNET_TARGET_DIR}/dotnet /usr/local/bin/dotnet;  
dotnet --info; 
