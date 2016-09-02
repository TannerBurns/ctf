# ctf

#First Time
Step 1) In terminal,inside the ctf-master:

		$vagrant up

Step 2) Go to 127.0.0.1:8080 in the browser

Step 3) (If it is first time using 'vagrant up') Register with the site

Step 4) To start site & servers,

		$vagrant ssh

		$devploy (if not the first time running system)
		
		$launch

#Updating/Adding problems
If you update/add problems,

	$genprob

#Important
-After first time using 'vagrant up', you will have to 'vagrant ssh' into the system and run 'devploy' & 'launch'

-After the 'launch' command, the terminal being used will be unusable while running. If that terminal is closed, the servers are closed.

Built on pico platform2
