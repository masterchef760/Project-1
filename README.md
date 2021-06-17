## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/masterchef760/Project-1/blob/7131bbdd61055fe7d114fc3043a9414417e40834/Diagrams/Full%20Server%20Infrastructure.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly _____, in addition to restricting _____ to the network.

- Load balancers can protect the network from DDoS attacks. It can also request a username and password before granting   access to the server to protect from unauthorized access. An advantage of a jump box is it can be used as a one stop shop to configure infrastructure as code and distribute updates to the webservers. The downside to that is if your jump box dies and you didnt save the files locally, you would have to go back and recreate all scripts/playbooks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.

- Filebeat watches for changes to the file system and when it was done.

- Metricbeat watches for system level items such as CPU usage, file systems, and process running.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web 1    |Web Server| 10.0.0.5   | Linux            |
| Web 2    |Web Server| 10.0.0.6   | Linux            |
| Web 3    |Web Server| 10.0.0.11  | Linux            |
|Elk-Stack |Monitoring| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox and Elk machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 69.110.61.186

Machines within the network can only be accessed by the Jumpbox Machine.
- 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 69.110.61.186        |
|  Web 1   | No                  | 10.0.0.5             |
|  Web 2   | No                  | 10.0.0.6             |
|  Web 3   | No                  | 10.0.0.11            |
| Elk-Stack| Yes                 | 69.110.61.186        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

- Ansible is a open source tool that is free. Ansible is easy to use and no specific coding skills are required. 

The playbook implements the following tasks:

Installs docker.io
Installs pip3
Installs Docker Python Module
Increases Virtual Memory
Downloads and launches a docker ELK Container
Enables docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/masterchef760/Project-1/blob/b0e6ecd1e2527de60405051a16a02c5952a1807f/Ansible/Images/docker_ps.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

| Name     | IP Addresses |
|----------|--------------|
|  Web 1   | 10.0.0.5     |
|  Web 2   | 10.0.0.6     |
|  Web 3   | 10.0.0.11    |

We have installed the following Beats on these machines:
-Filebeat
-Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat - It is a lightweight shipper for forwarding and centralizing log data. 
- Metricbeat - Monitors system-level items such as CPU usage, file system, disk IO, network IO statistics, and processes running on the system.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

- The user will need to download 3 playbook files and they are:

  - filebeat-playbook.yml
  - filebeat-config.yml
  - install-elk.yml 

- The files go in these specific folders:
  - filebeat-config.yml > /etc/ansible/files
  - filebeat-playbook.yml > /etc/ansible/
  - install-elk.yml > /etc/ansible
  
- The user will need to update the hosts file under the filepath /etc/ansible. He/she will need to uncomment the Webservers portion of the hosts file and add the WebVMs internal IP addresses. The user will also need to create another IP listing similiar to Webservers and they can name it anything they like but prefrence is to name it ELK so they know which machine that is pointing to. After they have created that they will need to add the ELK servers internal IP to that list. The user will then need to return to the /etc/ansible directory and run the following command to install the ELK Stack:

  - ansible-playbook install-elk.yml

- They can navigate to this address to see if the ELK stack was successfully installed:

 - ELKSERVERPUBLICIP:5601/app/kibana#/home

- Once the user has confirmed that the ELK stack is up and running they can run the following command in their ansible container to install filebeat:

  - ansible-playbook filebeat-playbook.yml

