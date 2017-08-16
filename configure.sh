#!/bin/sh
###############################################################################
### configure.sh script for pyominas
### meant to be run after repository is cloned, but before use
### currently 3 sections: pyo, pythonpath, and alias
###############################################################################

printf "Running pyominas' configure.sh script...\n"

### PYOMINAS_DIR
while true
do
	printf "\n"
	read -p "Would you like to enter the path to your pyominas directory? Otherwise, your current directory will be used as your pyominas directory.  [y/n]" yn
		case $yn in
			[Yy]* ) printf "\n"
							read -p "Please enter the path to your pyominas directory: `echo $'\n'`" path
							echo "path: $path"

							if [ -n "$path" ]; then
								PYOMINAS_DIR=$path
								echo "PYOMINAS_DIR: $PYOMINAS_DIR"
								echo "Assuming you have run ominas' configure.sh, we will be exporting environment variables to your .bashrc."
								# update ~/.bashrc
								printf "\n"
								echo "" >> ~/.bashrc.bak
								echo "#added by pyominas' configure.sh" >> ~/.bashrc
								echo "export PYOMINAS_DIR=$PYOMINAS_DIR" >> ~/.bashrc
								echo "Exporting complete."
								printf "\n"
							# this doesn't seem to recognize invalid path's -- is there a better bash command for the if?
							else
								echo "Path is empty. Using current directory as path."
								PYOMINAS_DIR=$PWD
								echo "PYOMINAS_DIR: $PYOMINAS_DIR"
								echo "Assuming you have run ominas' configure.sh, we will be exporting environment variables to your .bashrc."
								# update ~/.bashrc
								printf "\n"
								echo "" >> ~/.bashrc.bak
								echo "#added by pyominas' configure.sh" >> ~/.bashrc
								echo "export PYOMINAS_DIR=$PYOMINAS_DIR" >> ~/.bashrc
								echo "Exporting complete."
								printf "\n"
							fi

							break;;

			[Nn]* ) printf "\n"
							PYOMINAS_DIR=$PWD
							echo "PYOMINAS_DIR: $PYOMINAS_DIR"
							echo "We are assuming you have run ominas' configure.sh script. We will be exporting environment variables to your .bashrc."
							# update ~/.bashrc
							printf "\n"
							echo "" >> ~/.bashrc
							echo "# added by pyominas' configure.sh" >> ~/.bashrc
							echo "export PYOMINAS_DIR=$PYOMINAS_DIR" >> ~/.bashrc
							echo "Exporting complete."
							printf "\n"

							break;;

			* ) echo 'Please input [y/n]:';;
		esac
done
# also export PYOMINAS_DIR to ensure that PYTHONPATH gets updated properly
export PYOMINAS_DIR=$PYOMINAS_DIR

### PYTHONPATH
# also need to implement a way of checking that this hasn't been done already
printf "Placing pyominas' directory first in PYTHONPATH.\n"

if [ "$PYTHONPATH" = "" ]; then
  export PYTHONPATH=$PYOMINAS_DIR
else
  export PYTHONPATH=$PYOMINAS_DIR:$PYTHONPATH
fi

if  "$PYTHONPATH" = "" ]; then
  echo "Unable to use PYOMINAS_DIR to change PYTHONPATH. Please insert your PYOMINAS_DIR into the front of your PYTHONPATH."
  exit 1
fi

printf "Successfully added pyominas' directory to PYTHONPATH.\n"

# question -- should I do this in .bashrc instead? If not, should I export in linux_pyominas instead?
# Don't want users running configure script every time they open their terminal.

### alias
# also need to implement a way of checking that this hasn't been done already
printf "Setting up pyominas alias.\n"

echo "alias pyominas=$PYOMINAS_DIR/linux_pyominas" >> ~/.bashrc
chmod a+x PYOMINAS_DIR/linux_pyominas

printf "Alias setup complete.\n"


### PYDIST_DIR_PYOMINAS
while true
do
	printf "\n"
	read -p "Have you installed Anaconda? [y/n]" yn
		case $yn in
			[Yy]* ) read -p "Please enter the path to the home directory of your Anaconda distrubution: " path
              echo "PYDIST_DIR_PYOMINAS: $path"
              export PYDIST_DIR_PYOMINAS=$path
              break;;
      [Nn]* ) read -p "Please enter the path to the home directory of the Python distribution you would like to use with pyominas: " path
              echo "Warning: pyominas has only been tested with Anaconda, largely because IDL's pre-existing bridge was developed using Anaconda."
              echo "PYDIST_DIR_PYOMINAS: $path"
              export PYDIST_DIR_PYOMINAS=$path
              break;;
      * ) echo 'Please input [y/n]:';;
  	esac
  done

### End
printf "\n"
printf "Configuration complete. Please close and re-open your terminal before using pyominas."
printf "\n"
