# Exam-second-semester

This is how i automated the provisioning of two Ubuntu-based servers, "Master" and "Slave", using Vagrant. I created a Bash script to automate the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack on the "Master" node. Then, i used an Ansible playbook to execute this script on the "Slave" node. Finally, i created a cron job on the "Slave" node to check the server's uptime.

Created a Vagrantfile to provision the "Master" and "Slave" VMs.

<img width="1680" alt="Screenshot 2024-04-22 at 00 48 53" src="https://github.com/manafak/Exam-second-semester/assets/149635098/b88fdcb5-8644-4656-b298-8bf93bdebff0">

Run vagrant up to start the VMs.
create bash script

<img width="1680" alt="Screenshot 2024-04-22 at 00 56 11" src="https://github.com/manafak/Exam-second-semester/assets/149635098/54406c6b-fcd7-473f-828f-b22c02d8ad87">

<img width="1680" alt="Screenshot 2024-04-22 at 00 56 42" src="https://github.com/manafak/Exam-second-semester/assets/149635098/bc54cbf2-8cc8-4641-9443-78e71ace023c">
