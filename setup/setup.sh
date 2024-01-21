cd ~/MagicMirror/modules

########## MMM-BackgroundSlideshow ##########
directory="MMM-BackgroundSlideshow"
if [ ! -d "$directory" ]; then
  git clone https://github.com/darickc/MMM-BackgroundSlideshow
  cd $directory
  npm install
  cd ..
  echo "MMM-BackgroundSlideshow installed."
else
    echo "MMM-BackgroundSlideshow already installed."
fi
