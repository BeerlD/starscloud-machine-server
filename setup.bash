echo off

echo Instalando chocolatey...
START /WAIT PowerShell "If(Get-Command -Name choco.exe -ErrorAction SilentlyContinue) { exit; } Else { Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) }"

echo Instalando Git e NodeJS...
START /WAIT PowerShell "choco upgrade nodejs.install -y; choco upgrade git.install -y;"

echo Implantando Servidor...
START /WAIT PowerShell "cd C:\Users\; git clone https://github.com/BeerlD/starscloud-machine-server.git;"
cd C:\Users\starscloud-machine-server\

echo Instalando/Configurando Pacotes...
npm init -y && npm install puppeteer express && npm install -g pm2

echo Liberando porta de acesso...
netsh advfirewall firewall add rule name="ApiReleaseSushinePin" dir=in action=allow protocol=TCP localport=5055

echo Iniciando servidor...
pm2 start server.js && pm2 save
echo Maquina Configurada com Sucesso.
timeout /T 5 /NOBREAK
exit
