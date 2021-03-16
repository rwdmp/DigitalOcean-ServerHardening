
## Go to target directory
su website
cd /etc/www/

## Install node
sudo apt-get install -y nodejs
sudo apt install npm

## Install react Create package
sudo npm install -g create-react-app

## Go to the WWW folder and create react app
sudo mkdir /usr/www
cd /usr/wwww
create-react-app APPNAME

# Initialize Git in the WWW directory

cd APPNAME
sudo git init .
sudo git add *
sudo git commit -m "first commit"
sudo git branch -M main
# Add origin to the git repository
sudo git remote add origin git@github.com:User/UserRepo.git
sudo git push origin main


# Start React NPM session without losing server when logging off

tmux new -s ReactServerRuntimeSession
# npm start
# CTRL-X

# To end process 
tmux list-sessions                          # Find out active sessions
tmux kill-session -t targetSession          # Kill targetSession



