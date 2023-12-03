@echo off

echo Instalando chocolatey...
START /WAIT PowerShell "If(Get-Command -Name choco.exe -ErrorAction SilentlyContinue) { exit; } Else { Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) }"

echo Instalando NodeJS...
START /WAIT PowerShell "choco upgrade nodejs.install"

echo Instalando Git...
START /WAIT PowerShell "choco upgrade git.install"

echo Implantando Servidor...
cd C:\Users\
git clone https://github.com/BeerlD/starscloud-machine-server.git
cd starscloud-machine-server

echo Instalando/Configurando Pacotes...
npm init -y
npm install puppeteer express

echo Liberando porta de acesso...
netsh advfirewall firewall add rule name="ApiReleaseSushinePin" dir=in action=allow protocol=TCP localport=5055

echo Iniciando servidor...
START /B CMD "cd C:\Users\starscloud-machine-server\ && node server.js"
echo Máquina Configurada com Sucesso.
