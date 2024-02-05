# repo1
some tools that were written upon request
## Tool 1
### Extraction
a tool that gets a list of files and or directories and uncompresses the files according to the deciphering of the 'file' command on them 
###### Written in bash
### Command name is **extract**
### sampleout.txt contains example test runs
## File structure includes
###### include - holding general bash files for reuse
###### scripts - different shell scripts that pertain to the compression command in use
###### datafiles - files that contain data such as the mapping file compressionInfo
### Supported formats for extract
#### bunzip2
#### compress
#### gunzip
#### unzip
###### Note in this version a compressed file will always contain a single compressed file and the decompression is only one level deep  i.e. if the compressed file is a tar archive the archive will not be opened
## Tool 2
### Groovy Branch Packaging
a tool that is triggered from GitHub when there were changes to a PR in repo
###### Written in Groovy
### It is defined a job in Jenkins will supply screen shots for the job configuration
## File structure includes
###### pipelines - packaging Job 
###### jsl - packaging Job using JSL
###### snapshots - contains configuration and output from Jenkins captured from a build session
###### src - framework for JSL
###### vars - lib.groovy (general functions), payloadlib.groovy (payload parser)
##### Note this version was tested using a classic Pipeline deployment without JSL 
######  Default considerations **git** and the JSL are setup correctly
## Tool 3
### Ansible playbook for deployment web app and monitor
###### Written with Dockerfile, docker-compose.yml playbook.yaml python and bash for the listener container
## Components
###### Simple web service container based on nginx
###### postgres container as the stateful data collector
###### listener container that monitors the hits on the web server
## File structure includes
###### app - contains the code for the listener container
###### html - contains the index.html page for the web server container
###### logs - (created by docker compose)  has the log files of web server container
## Files
###### Dockerfile - builds the listener container include all python libraries needed
###### docker-compose.yml - describes and deploys the product
###### playbook.yaml - for deploying product using ansible
