# Provision a new server

spigot
https://www.spigotmc.org/wiki/buildtools/
    # Install dependencies
    Both git and Java, as well as util commands, can be installed using a single command via your package manager.
    Debian/Ubuntu: sudo apt-get install git openjdk-8-jre-headless
    CentOS/RHEL: sudo yum install git java-1.8.0-openjdk-devel
    
    Download BuildTools.jar from https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    mkdir /opt/spigot/
    cd /opt/spigot
    wget -O BuildTools.jar <url>
    
    # Download git dir
    git config --global --unset core.autocrlf
    # Run build tools
    java -jar BuildTools.jar
    
    Versions
    java -jar BuildTools.jar --rev latest
    java -jar BuildTools.jar --rev 1.16.1
    java -jar BuildTools.jar --rev 1.15.2
    ....
    
  #install
    # Provision a new server
    # Create a new unprivileged user for minecraft
    useradd -r -m -d /opt/minecraft minecraft
    
    # Create the directory that will house our minecraft instance
    sudo su --shell /bin/bash minecraft
    mkdir /opt/minecraft
    exit
    
    # Create a new folder to house your instance
    cd /opt/minecraft
    mkdir worldName
    
    # Copy the spigot Jar to the instance folder
    cp /opt/spigot/spigot-{VER}.jar /opt/minecraft/worldname/minecraft_server.jar
        # alt method, make a link
        ln -s spigot{ver}.jar /opt/minecraft/worldname/minecraft_server.jar
    
    
    # Copy the minecraft@.service file into the correct place.
    sudo vim /etc/systemd/system/minecraft@.service
    
    # Reload systemd units
    sudo systemctl daemon-reload
    
    # Start and enable (start after boot) the server.
    sudo systemctl start minecraft@worldName
    sudo systemctl enable minecraft@worldName
    
    # Copy backup script
    
    # Setup backukp Cron
    
    
# Inplace upgrade
    # Run build tools
    cd /opt/spigot
    sudo java -jar BuildTools.jar
    # stop mc service
    sudo systemctl stop minecraft@worldName
    # Backup MC jar
    cp minecraft_server.jar backup/1.15.2.jar
    # replace jar with spigot
    cp /opt/spigot/spigot-{VER}.jar /opt/minecraft/worldname
    # start the server
    sudo systemctl start minecraft@worldName
    
