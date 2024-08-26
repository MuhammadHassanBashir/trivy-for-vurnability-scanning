# trivy-for-vurnability-scanning

Below are the command that will using for install trivy on linux vm..


    sudo apt-get install wget apt-transport-https gnupg lsb-release
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
    echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
    sudo apt-get update
    sudo apt-get install trivy


    trivy --version

with trivy we can generate vurnability report of **images**, **kubernetes** and many more..

We can run docker container for **postee** that will get report and send it to configure endpoint.. 

or you can use jenkins that will get and send report via email 


## Enable permission for pulling docker images from private repo..

Login to the google cloud using google allowed user 

    gcloud auth login

Access gcp project where you need to pull images from private repo

    gcloud config set project your-project-id

Use utility so we can pull image from gcr 

    gcloud auth configure-docker --quiet

now add your vm user to docker group. so your user would have docker permissions. And with this you can pull docker images.

    sudo usermod -aG docker hassan     ---> here hassan is vm user, which i need to add to docker group

now refresh the group

    After running the above command, you need to log out and log back in for the changes to take effect. Alternatively, you can run the following command to refresh your group membership without logging out:

    newgrp docker       ---> here group name is docker..


    now run the script. the script will pull images from docker and with trivy it will be finding vurnability...


    
