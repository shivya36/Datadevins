----- Setting up non root user and adding it to sudoers -----
* to add new user: adduser username
* to add the new user in sudoers: run visudo command and then add username  ALL=(ALL) NOPASSWD:ALL and also usermod -aG sudo username

----- Setting up bin directory -----
* to add bin directory: mkdir bin in user home directory
* to add setup.sh: touch setup.sh in bin directory
* to set permissions: chmod 777 setup.sh

----- Setting up PATH variable -----
* to add ~/bin in PATH: export PATH="$HOME/bin:$PATH"
