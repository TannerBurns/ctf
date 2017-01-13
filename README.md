# ctf

#Clone/Download Repository
Regardless of the system you are using, you are going to need to have access to this repository. However, the system you are using could effect the way you go about doing so. 
	
Linux/OS X Users:

	Option 1) Clone - 
	
		a. Make sure that you are viewing the "<> Code" tab of the ctf repository page.
		b. Find the green "Clone or download" button at the top right corner of the page.
		c. Click the button and copy the web URL that is displayed in the box.
		d. Open a terminal and choose the directory that you want to clone into.
		e. Now, by using the command "$git clone https://github.com/TannerBurns/ctf.git", you will create a local remote repository in directory "ctf".
	
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

Step 2) (refresh vm and start cronjobs) 
		
		$vagrant reload

Step 3) Go to 127.0.0.1:8080 in the browser

Step 3) (If it is first time using 'vagrant up') Register with the site

Step 4) To go into vagrant vm

		$vagrant ssh (does not work on windows-use program like putty)

#Anytime you want to start vm(ctf) after install

		$vagrant up


#If install fails (IMPORTANT)
	If the install fails,
		1) $vagrant destroy

		2) Delete directroy that you tried to vagrant up in

		3) Reclone or recreate the directory

		4) try vagrant up again

		5) Windows users - there could be a ssh timeout that could be caused from a firewall blocking the ssh connection (try turning off firewall software)

#Useful vagrant commands(ouside vm)

	$vagrant up -> start the vm

	$vagrant ssh -> ssh into the virtual machine (if in windows, easier to use virtualbox vm)

	$vagrant halt -> shuts down vm

	$vagrant destroy -> destroys vm, removes all vm files

#Useful platform commands(inside vm)

	$devploy -> builds the website

	$genprob -> erases current problems from database and regenerates the old and new problems


#Updating/Adding problems
If you update/add problems,

	$genprob

Built on pico platform2
