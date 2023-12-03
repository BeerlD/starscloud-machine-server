Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install nodejs.install
choco install git.install
choco upgrade nodejs.install

cd C:/
git clone https://github.com/BeerlD/starscloud-machine-server.git
cd starscloud-machine-server

npm init -y
npm install puppeteer express
netsh advfirewall firewall add rule name="ApiReleaseSushinePin" dir=in action=allow protocol=TCP localport=5055
node server.js
