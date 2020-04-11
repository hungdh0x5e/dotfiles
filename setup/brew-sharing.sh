#!/bin/sh
echo "checking brew ..."
brew doctor `brew doctor --list-checks | grep -v stray_headers`

echo "Change the group of Homebrew to group is staff"
sudo chgrp -R staff $(brew --prefix)/*
ls -la $(brew --prefix)

echo "Allow group staff to write inside"
sudo chmod -R g+w $(brew --prefix)/*
ls -la $(brew --prefix)
