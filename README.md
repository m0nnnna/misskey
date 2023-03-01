This will be a guide to setup and configure Misskey to run within Docker, this should work on any operating system that can run Docker.

Now depending on what OS you use will decide how you go about setting up Docker, Linux you will need to install Docker and docker-compose, Windows and MacOS should include docker-compose with Docker Desktop.

Now you will need to download the files listed in this repo, these files should be out of the box ready to go. 

There are some changes you need to be aware of, there is a single docker-compose.yaml that will have ENDPOINT put your domain name there, there are two Dockerfiles, one in postgresql and misskey both of these are using alpine to run you'll notice in postgresql it is using the tag "alpine" while misskey is using "alpine:20221110" this tag refers to the very latest version of alpine and is sometimes needed by misskey to have the most recent packages available. 

Simply toss these files into a folder I'm using Windows and have it set as "C:\DIRECTORY\WORKINGDIRECTORY" just a simple place you can locate the files. 

Now open your terminal/powershell/cmd cd into your directory and run "docker-compose build --no-cache" this will force a clean rebuild of the setup. 

Once this completes depending on your system it can take awhile, run "docker-compose up -d" now the containers are built and running. 

For this configuration a cloudflare account is needed, so set your domain up in cloudflare and configure your DNS, also in cloudflare DNS settings set security to "Full". 

Misskey will generate its own certs no need for certs at all with this setup.

You should be ready to setup your admin account and call it a day.

When a new version of misskey is released you will need to run again the same two commands "docker-compose build --no-cache" and "docker-compose up -d" this will build the latest version, make sure to take note during the first run of the containers to check and see if they are complaining about needing X version of installed software, you will need to adjust your alpine linux version in the Dockerfile.
