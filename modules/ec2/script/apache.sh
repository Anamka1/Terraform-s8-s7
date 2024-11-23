
    #!/bin/bash
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    sudo systemctl enable apache2
