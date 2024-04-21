# Exam-second-semester

This is how i automated the provisioning of two Ubuntu-based servers, "Master" and "Slave", using Vagrant. I created a Bash script to automate the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack on the "Master" node. Then, i used an Ansible playbook to execute this script on the "Slave" node. Finally, i created a cron job on the "Slave" node to check the server's uptime.

Created a Vagrantfile to provision the "Master" and "Slave" VMs.
