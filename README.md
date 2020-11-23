# SIFA2 Project

## Repos & Jira
Project Files: https://github.com/Cpt-Falconator/CNE-SIFA2 <br>
Terraform Files: https://github.com/Cpt-Falconator/CNE-Second-Project/tree/Development <br>
Misc Install Scripts: https://github.com/Cpt-Falconator/Install-scripts <br>
<br>
Jira Board: https://cptfalconator.atlassian.net/secure/RapidBoard.jspa?rapidView=3&projectKey=SP <br>
## Contents
* [Brief](#brief)
	* [Requirements](#requirements)
* [Planning](#planning)
	* [Jira Board](#jira-board)
* [CI Pipeline](#ci-pipeline)
* [Future Improvements](#future-improvements)
* [Acknowledgements](#acknowledgements)

## Brief
The initial brief has the following objective:
- The final deliverable for this project is a completed CI Pipeline with full documentation around the utilisation of supporting tools.

### Requirements
Along with the previous brief, the minimum requirements to achieve MVP (Minimum Viable Product) as as follows:
- A Jira board with full expansion on tasks needed to complete the project.
- This could also provide a record of any issues or risks that you faced creating your project.
- The application must be deployed using containerisation and orchestration tools.
- The application must be tested through the CI pipeline.
- The project must make use of two managed Database Servers: 1 for Testing and 1 for Production.
- If a change is made to the code base, Webhooks should be used so that Jenkins recreates and redeploys the changed application.
- The infrastructure for the project should be configured using an infrastructure management tool (Infrastructure as Code).
- As part of the project, you need to create an Ansible Playbook that will provision the environment that your CI Server needs to run.
- The project must make use of a reverse proxy to make your application accessible to the user.

## Planning
All of the DevOps material we have covered so far started me off with a decent idea of where to start off with, that would be creating a terraform environment for setting up all the reasource I would need to use,
Secondly, create an Ansible playbook that would provision the VM's with all of the software required, the likes of the Requirements, Jenkins, Docker, AWSCLI, K8.
From here, I planned to create a Jenkinsfile that would run split the task into it's stages, those being Testing, Uploading and Deploying.
Once the tests have passed (_issue here_), it will then build the successful docker images and push them up onto dockerhub. Finally, it will access K8, and will deploy the application onto the cluster using the images that were built. (_issue here too_)

![jenkinspipeline][jenkinspipeline]

### Jira Board
The application was planned and executed alongside a Jira Kanban board, which helped keep track of all the functional requirements and gave a good understanding as to the progress towards MVP, as well as any fuether features and their coreleating priorities.

![jiraboard][jiraboard]

## CI Pipeline
The application follows a Continous Integration Pipeline, meaning that any changes pushed to git will be automatically tested and (if successful) deploy the changes to the live server without disrupting the user experience.

(Gif of a jenkins build running : https://gyazo.com/7c964e30c7fe151b0419da76264be781) <br>
![jenkinssuccess][jenkinssuccess]

The Kubernetes cluster was composed of 2 VM's, containing 2 nodes each of the Backend, Frontend (flask app) and nginx (Webpage) spread across them.

![clustersetup][clustersetup]

A few intermediate steps require SSH'ing onto the JenkinsVM and declaring some environment variables, however this only has to be done once, or whenever these variables are changed.
	
## Future Improvements
The project as a whole was a failure and did not meet the MVP in a few regards. These are to follow;<br>
- GIT Polling to Jenkins failed to connect, meaning automatic builds did not take place.
- The tests when through a few issues, firstly it was not achieving full coverage, resulting in a fail, but still a successsful Jenkins build, secondly, failed to even run the tests due to a port binding conflict.
- Server Error of 500 or 502. The Nginx failed to communicate with the frontend or backend.
- There were a few "data breaches" resulting in condidential files being pushed to git, these being the database endpoints, username and passwords.

![500error][500error]
![502error][502error]

## Acknowledgements
For this project I have used several different pieces of software and api's. These being:

Jira: https://www.atlassian.com/software/jira <br>
Amazon Web Services (AWS): https://aws.amazon.com/ <br>
Visual Studio Code: https://code.visualstudio.com/ <br>
Nginx: https://www.nginx.com/ <br>
Docker/Dockerhub: https://www.docker.com/ <br>
Git: https://github.com/ <br>
Terraform: https://www.terraform.io/ <br>
Ansible: https://www.ansible.com/ <br>
Kubernetes: https://kubernetes.io/ <br>

I would also like to thank the QA Trainers and my fellow training colleagues for their help and support, as well as apologise for my shortcomings.

[jenkinssuccess]: https://i.gyazo.com/625eac4e8ae4986d08c67c4bfab76c77.png
[jenkinspipeline]: https://gyazo.com/c2d2dc949099565fc9c0de0a41739046
[502error]: https://i.gyazo.com/f8d16ea04b0eeec5403a4944be7c832b.png
[500error]: https://i.gyazo.com/5a97629c910fa4bad96a6e9b53ad9e5c.png
[jiraboard]: https://i.gyazo.com/278b7d2874aa47fd08b8a6dea889797f.png
[clustersetup]: https://i.gyazo.com/88e694e5d8a24c20f8f39d900104b9d0.png
