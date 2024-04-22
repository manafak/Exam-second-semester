# Exam-second-semester

This is how i automated the provisioning of two Ubuntu-based servers, "Master" and "Slave", using Vagrant. I created a Bash script to automate the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack on the "Master" node. Then, i used an Ansible playbook to execute this script on the "Slave" node. Finally, i created a cron job on the "Slave" node to check the server's uptime.

Created a Vagrantfile to provision the "Master" and "Slave" VMs.

<img width="1680" alt="Screenshot 2024-04-22 at 00 48 53" src="https://github.com/manafak/Exam-second-semester/assets/149635098/b88fdcb5-8644-4656-b298-8bf93bdebff0">

Run vagrant up to start the VMs.
create bash script deploy_lamp.sh

<img width="1680" alt="Screenshot 2024-04-22 at 00 56 11" src="https://github.com/manafak/Exam-second-semester/assets/149635098/54406c6b-fcd7-473f-828f-b22c02d8ad87">

<img width="1680" alt="Screenshot 2024-04-22 at 00 56 42" src="https://github.com/manafak/Exam-second-semester/assets/149635098/bc54cbf2-8cc8-4641-9443-78e71ace023c">

<img width="1680" alt="Screenshot 2024-04-22 at 00 56 49" src="https://github.com/manafak/Exam-second-semester/assets/149635098/fe55961c-8e1f-440f-a1ad-90be372a522d">

grant execution for the file and deploy.

<img width="1680" alt="Screenshot 2024-04-20 at 16 06 20" src="https://github.com/manafak/Exam-second-semester/assets/149635098/64fc8f39-60af-446b-8946-ead5cf67ba6f">

<img width="713" alt="Screenshot 2024-04-22 at 01 07 14" src="https://github.com/manafak/Exam-second-semester/assets/149635098/d7e32fdd-eeb4-43a6-b082-3ea9d9c5a580">

we can access the PHP application laravel using the ip address of the master node

<img width="1680" alt="Screenshot 2024-04-20 at 14 44 32" src="https://github.com/manafak/Exam-second-semester/assets/149635098/3102c98c-107d-4356-84de-c62dbe424006">

<img width="1680" alt="Screenshot 2024-04-20 at 14 51 23" src="https://github.com/manafak/Exam-second-semester/assets/149635098/3b78ab59-c2fd-4f39-b795-2f96b1cabda3">

After successful deployment of the bash script. we connect our master vm to our slave.
we generate ssh key using  'ssh-keygen', after they're generated we run 'ssh-copy-id(vagrant ip address)'. we complete the configuration and install Ansible using 'sudo apt install ansible'.

we cd in ansible and create our inventory file which will hold our slave ip address.

we run 'ansible -i inventory slave -m ping', this command tells Ansible to use the inventory file named inventory, target the host or group called slave, and then run the ping module to check if it can reach the target machine(s) and if it has the necessary permissions to run commands on it.

We create our playbook with an extension of our cron job in 'playbook.yml'

<img width="747" alt="Screenshot 2024-04-22 at 01 38 11" src="https://github.com/manafak/Exam-second-semester/assets/149635098/b7e89ba2-fdd1-4f1d-b528-c5b5bc0b54cb">

We execute our playbook using the command 'ansible-playbook -i inventory playbook.yml'

<img width="1680" alt="Screenshot 2024-04-21 at 15 53 28" src="https://github.com/manafak/Exam-second-semester/assets/149635098/eb1b8e37-2a14-488f-aae2-17b3d90ed3eb">

We access the PHP application (laravel) through the "Slave" VM's IP address in a web browser.

<img width="526" alt="Screenshot 2024-04-22 at 01 50 20" src="https://github.com/manafak/Exam-second-semester/assets/149635098/d3cbce6b-a35a-4263-b42a-77f5a1db4a3c">

<img width="1680" alt="Screenshot 2024-04-22 at 01 25 21" src="https://github.com/manafak/Exam-second-semester/assets/149635098/94b6ce07-329f-494f-b9cc-450e4c2443bd">
