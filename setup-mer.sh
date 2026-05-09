#!/bin/bash

echo "======================================="
echo "Updating system..."
echo "======================================="

sudo apt update && sudo apt upgrade -y

echo "======================================="
echo "Installing essential tools..."
echo "======================================="

sudo apt install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    unzip

echo "======================================="
echo "Installing Node.js (LTS)..."
echo "======================================="

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

sudo apt install -y nodejs

echo "Node Version:"
node -v

echo "NPM Version:"
npm -v

echo "======================================="
echo "Installing Yarn..."
echo "======================================="

npm install -g yarn

echo "======================================="
echo "Installing global MERN packages..."
echo "======================================="

npm install -g \
    nodemon \
    pm2 \
    create-react-app \
    vite \
    express-generator \
    eslint \
    prettier

echo "======================================="
echo "Installing MongoDB..."
echo "======================================="

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
--dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt update

sudo apt install -y mongodb-org

echo "======================================="
echo "Starting MongoDB..."
echo "======================================="

sudo systemctl start mongod
sudo systemctl enable mongod

sudo systemctl status mongod --no-pager

echo "======================================="
echo "Installing MongoDB Compass..."
echo "======================================="

wget https://downloads.mongodb.com/compass/mongodb-compass_1.46.0_amd64.deb

sudo apt install -y ./mongodb-compass_1.46.0_amd64.deb

echo "======================================="
echo "Installing Visual Studio Code..."
echo "======================================="

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg \
/etc/apt/keyrings/packages.microsoft.gpg

echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list

rm -f packages.microsoft.gpg

sudo apt update

sudo apt install -y code

echo "======================================="
echo "Installing Postman..."
echo "======================================="

sudo snap install postman

echo "======================================="
echo "Installing Google Chrome..."
echo "======================================="

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install -y ./google-chrome-stable_current_amd64.deb

echo "======================================="
echo "Creating MERN workspace..."
echo "======================================="

mkdir -p ~/MERN-Projects

echo "======================================="
echo "Setup completed successfully!"
echo "======================================="

echo ""
echo "Installed:"
echo "✔ Node.js"
echo "✔ npm"
echo "✔ Yarn"
echo "✔ MongoDB"
echo "✔ MongoDB Compass"
echo "✔ VS Code"
echo "✔ React tools"
echo "✔ Express Generator"
echo "✔ Nodemon"
echo "✔ PM2"
echo "✔ Git"
echo "✔ Postman"
echo "✔ Chrome"
echo ""

echo "Workspace:"
echo "~/MERN-Projects"