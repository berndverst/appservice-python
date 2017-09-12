#!/usr/bin/env bash
service ssh start

### INSTALL USER DEPENDENCIES

cd /home/site/wwwroot
touch requirements.txt
pip install --no-cache-dir -r requirements.txt

echo "Launching application."
python app.py
