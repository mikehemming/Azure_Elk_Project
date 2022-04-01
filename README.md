## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Azure ELK Stack Network Diagram](https://github.com/mikehemming/Azure_Elk_Project/blob/main/Diagrams/Azure_ELK_Network_Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible file may be used to install only certain pieces of it, such as Filebeat.

  - {Filebeat Playbook}(https://github.com/mikehemming/Azure_Elk_Project/blob/main/Ansible/filebeat-playbook.yml) 

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protect your network from overloaded with incoming traffic either from normal traffic or potential attacks such Denial of Service (DOS) attacks or ping attacks. Many times they can act as a Security Group or Firewall restricting incoming or outgoing traffic through IP restrictions and opening and closing ports. Use of a jumpbox provides a single point of entry into your network which you can restrict access through the use of Security Groups and firewalls. This greatly reduces the surface area exposed to attack and offers a strong measure of control of your network

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system configuration.
- Filebeat monitors log files and collects log events, sending them to Logstash or Elasticsearch.
- Metricbeat records metrics and statistics and forwards them to Logstash or Elasticsearch.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name      | Function | IP Address | Operating System |
|-----------|----------|------------|------------------|
| JumpBox   | Gateway  | 10.0.0.1   | Linux            |
| Web 1     | DVWA     | 10.0.0.9   | Linux            |
| Web 2     | DVWA     | 10.0.0.10  | Linux            |
| Web 3     | DVWA     | 10.0.0.11  | Linux            |
| ELK Server| ELK Stack| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumbBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- IP: 208.157.162.45

Machines within the network can only be accessed by the Ansible container on the Jumpbox.
- The ELK Server can be accessed from Ansible on the JumpBox, originating IP: 10.0.0.1

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses   |
|-----------|---------------------|------------------------|
| JumpBox   | Yes                 | 208.157.162.45         |
| Web 1     | No                  | 10.0.0.1               |
| Web 2     | No                  | 10.0.0.1               |
| Web 3     | No                  | 10.0.0.1               |
| Elk Server| No/Yes              | 10.0.0.1/208.157.162.45|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- If the server needs to be deleted and rebuilt or the servers need to be duplicated, the new servers will be identical since all will be built with the same automated configurations.

The playbook implements the following tasks:
- Install the Docker on the ELK Server.
- Download and install the ELK container image.
- Update the system to increase the usable memory.
- Launch the ELK container and enable service to start on boot.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Elk Server Docker Configuration](https://github.com/mikehemming/Azure_Elk_Project/blob/main/Ansible/Elk_Server_Status.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.9 
- 10.0.0.10  
- 10.0.0.11

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log files/events from our Webservers running DVWA, aggregates them and sends to Elasticsearch in our case. These logs can be reviewed for suspicious activity such as access to admin only directories.
- Metricbeat records various metrics and statistics on the webservers and sends to Elasticsearch for review. This information can be used to identify odd behavior from the webservers such as unusualy RAM or CPU usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk_server.yml file to /etc/ansible directory.
- Update the /etc/ansible/hosts file to include the group name (ELK) and the ELK Server IP Address under this group.
- Run the playbook, and navigate to (elk server IP):5601/app/kibana to check that the installation worked as expected.
- to run the playbook use the following command;
   ```
   sudo ansible-playbook (playbook_name.yml)
   ```