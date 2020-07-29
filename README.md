# Install

    # Install dependencies
    sudo yum install -y java-1.8.0-openjdk screen
    
    # Create a new unprivileged user for minecraft
    useradd -r -m -d /opt/minecraft minecraft
    
    # Create the directory that will house our minecraft instances
    sudo su --shell /bin/bash minecraft
    exit
    
    # Copy the minecraft@.service file into the correct place.
    sudo vi /etc/systemd/system/minecraft@.service
    
    # Reload systemd units
    sudo systemctl daemon-reload

# Provision a new server

    # Sudo into the minecraft user's shell
    sudo su --shell /bin/bash minecraft
    
    # Create a new folder to house your instance
    cd /opt/minecraft
    mkdir worldName
    
    # Install your minecraft instance, and make sure there is a minecraft_server.jar file.
    # If you use Forge servers, you can use the following:
    ln -s forge*.jar minecraft_server.jar
    
    # Start and enable (start after boot) the server.
    sudo systemctl start minecraft@server1
    sudo systemctl enable minecraft@server1
