# sonarqubeEx

At ```http://localhost:3000/``` you will see all projects.
![alt text](https://github.com/onatbuyukakkus/sonarqubeEx/blob/master/Screenshots/Homepage.png "Homepage")

---

To add new a project go ```http://localhost:3000/posts/new```. You will be asked Project Name and Github Link (.git).
![alt text](https://github.com/onatbuyukakkus/sonarqubeEx/blob/master/Screenshots/PostNewProject.png "PostNewProject")

---

When you click Add Project button, project with the provided link will be pulled down to your home directory (see  ```MySonarEx.hs ```), SonarQube scanner will scan your project and you will be redirected to SonarQube dashboard: ```http://localhost:9000/sonar/```
![alt text](https://github.com/onatbuyukakkus/sonarqubeEx/blob/master/Screenshots/SonarQubeDashboard.png "SonarQubeDashboard")

---

If you commited a change, you can homepage, click on the project and you will see an update button. This button pulls down commits and run SonarQube, redirect you to SonarQube dashboard.
![alt text](https://github.com/onatbuyukakkus/sonarqubeEx/blob/master/Screenshots/ProjectDetails.png "ProjectDetails")

