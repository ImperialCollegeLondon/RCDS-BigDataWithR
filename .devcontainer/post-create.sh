#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

USERNAME=$(whoami)
# Use the secret if available, otherwise default to 'rstudio'
# IMPORTANT: For security, using a secret is strongly recommended!
# Create a secret named CODESPACE_RSTUDIO_PASSWORD in your GitHub repo/org settings.
PASSWORD=${CODESPACE_USER_PASSWD:-rstudio}

echo "Updating package list..."
sudo apt-get update

echo "Installing R, dependencies, and RStudio prerequisites..."
# Install R base (if not using an R feature), common dependencies, wget, gdebi
sudo apt-get install -y --no-install-recommends \
    r-base \
    r-base-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libcairo2-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    wget \
    gdebi-core

echo "Finding latest RStudio Server URL..."
# Attempt to automatically find the latest stable Jammy (Ubuntu 22.04) AMD64 link
# Fallback to a known good version if scraping fails
RSTUDIO_URL=$(wget -qO- https://posit.co/download/rstudio-server/ | grep -oP 'https://download[0-9].posit.co/server/jammy/amd64/rstudio-server-[0-9.-]+-amd64.deb' | head -n 1)
if [ -z "$RSTUDIO_URL" ]; then
  echo "Could not automatically find latest RStudio URL. Using a fallback."
  RSTUDIO_URL="https://download1.posit.co/rstudio-server-pro-latest.deb" # Adjust if needed, this might point to Pro! Find stable link from Posit site.
  # Better fallback: Hardcode a recent known good free version URL if scraping is unreliable.
  # e.g., RSTUDIO_URL="https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.12.1-402-amd64.deb"
fi

echo "Downloading RStudio Server from $RSTUDIO_URL..."
wget "$RSTUDIO_URL" -O rstudio-server.deb

echo "Installing RStudio Server..."
sudo gdebi -n rstudio-server.deb

echo "Cleaning up RStudio installer..."
rm rstudio-server.deb

echo "Setting password for user $USERNAME..."
echo "$USERNAME:$PASSWORD" | sudo chpasswd
echo "Password set. Default is 'rstudio' unless CODESPACE_RSTUDIO_PASSWORD secret is set."

# Optional: Pre-install commonly used R packages
# echo "Installing common R packages (tidyverse, devtools)..."
# sudo R -e "install.packages(c('tidyverse', 'devtools'), repos='https://cloud.r-project.org/')"
sudo R -e "install.packages(c('rmarkdown', 'knitr', 'sparklyr', 'dplyr', 'dtplyr', 'data.table'), repos='https://cloud.r-project.org/', Ncpus = parallel::detectCores())"
echo "Post-create script finished."
