# ctf

#Clone/Download Repository
Regardless of the system you are using, you are going to need to have access to this repository. However, the system you are using could effect the way you go about doing so. 
	
Linux/OS X Users:

	Option 1) Clone - 
	
		a. Make sure that you are viewing the "<> Code" tab of the ctf repository page.
		b. Find the green "Clone or download" button at the top right corner of the page.
		c. Click the button and copy the web URL that is displayed in the box.
		d. Open a terminal and choose the directory that you want to clone into.
		e. Now, by using the command "$git clone <https URL>", you will create a local remote repository.
	
	Option 2) Download ZIP - 
	
		a. Make sure that you are viewing the "<> Code" tab of the ctf repository page.
		b. Find the green "Clone or download" button at the top right corner of the page.
		c. Find the "Download ZIP" button in the resulting window.
		d. Click it, download the zip file, and extract the files into the local directory of your choice.
	
Windows Users:

		Download ZIP -
		
		a. Make sure that you are viewing the "<> Code" tab of the ctf repository page.
		b. Find the green "Clone or download" button at the top right corner of the page.
		c. Find the "Download ZIP" button in the resulting window.
		d. Click it, download the zip file, and extract the files into the local directory of your choice.
		
#First Time
Step 0) Have latest virtualbox(www.virtualbox.org) installed and the latest vagrant(www.vagrantup.com) installed.

Step 1) In terminal,inside the ctf-master:

		$vagrant up --provider virtualbox

Step 2) Go to 127.0.0.1:8080 in the browser

Step 3) (If it is first time using 'vagrant up') Register with the site

Step 4) To go into vagrant vm

			$vagrant ssh (does not work on windows-use program like putty)

#Anytime you start vm(ctf) after install
You must go into the vm via ssh or vb manager and run 'devploy' inside the machine. This will start the services for the website.
	$echo 'devploy' | vagrant ssh


#If install fails (IMPORTANT)
	If the install fails,
		1) $vagrant destroy

		2) Delete directroy that you tried to vagrant up in

		3) Reclone or recreate the directory

		4) try vagrant up again

		5) Windows users - there could be a ssh timeout that could be caused from a firewall blocking the ssh connection (try turning off firewall software)

#Useful Commands
	$vagrant up -> start the vm

	$vagrant ssh -> ssh into the virtual machine (if in windows, easier to use virtualbox vm)

	$vagrant halt -> shuts down vm

	$vagrant destroy -> destroys vm, removes all vm files

	$devploy -> builds the website

	$launch -> starts servers (leave terminal open)

	$genprob -> erases current problems from database and regenerates the old and new problems


#Updating/Adding problems
If you update/add problems,

	$genprob

#Important
-After first time using 'vagrant up', you will have to 'vagrant ssh' into the system and run 'devploy' & 'launch'

-After the 'launch' command, the terminal being used will be unusable while running. If that terminal is closed, the servers are closed.

Built on pico platform2
