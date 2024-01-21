@echo off
cd R:\Dev\MagicMirror\
npm run install-mm
cd fonts && npm install && cd ..
cd vendor && npm install && cd ..
