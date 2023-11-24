# Django Project Setup and Deployment Guide

## Setting up Django Project on EC2 Instance

1. **Create a Django Project:**
   - Create a new Django project.

2. **Add Project to Git Repository:**
   - Initialize a Git repository for your project and commit the initial code.

3. **Create an EC2 Instance with SSH Allowed:**
   - Launch an EC2 instance and ensure that SSH is allowed in the security group.

4. **Connect with EC2 Instance and Install Updates:**
   - SSH into the EC2 instance and install system updates.

5. **Install Dependencies:**
   - Install Python3, Git, and Django on the EC2 instance.

6. **Make Project Directory (Optional):**
   - Create a project directory at a preferred location (optional step).

7. **Navigate to Project Directory:**
   - Change to the project directory.

8. **Clone the Git Repository:**
   - Clone the Git repository into the project directory.

9. **Navigate to Cloned Project Directory:**
   - Change to the cloned project directory.

10. **Install Project Requirements (Optional if not using Docker):**
    - Install all project requirements.

11. **Configure Security Group:**
    - Update the security group to allow requests on port 8000.
      - Settings => Custom TCP   8000   Anywhere   0.0.0.0 

12. **Run the Django Server:**
    - Execute the following command to run the Django server:
      ```bash
      python3 manage.py runserver 0.0.0.0:8000
      ```

13. **Access the App:**
    - Access the app using the public IP of the EC2 instance.
      - Example: http://EC2-Public-IP:8000

## Dockerization

14. **Write Dockerfile:**
    - Create a Dockerfile for your Django project.

15. **Test Dockerfile Locally:**
    - Build and run the Docker image locally using the following commands:
      ```bash
      docker build -t my-python-app:1.0 .
      docker image ls
      docker run -p 8000:8000 my-python-app:1.0
      - Visit http://localhost:8000 to test.
      ```

16. **Push Dockerfile Code to Repo:**
    - Commit and push the Dockerfile code to the Git repository.

17. **Merge Code:**
    - Merge the Dockerfile code into the main branch.

18. **Pull Updated Code on EC2:**
    - SSH into the EC2 instance and pull the updated code.

19. **Install Docker on EC2:**
    - Install Docker on the EC2 instance using the following commands:
      ```bash
      sudo apt-get install docker.io –y
      sudo systemctl start docker
      sudo systemctl enable docker
      sudo docker run hello-world
      docker –version
      systemctl status docker --no-pager –l
      sudo usermod -aG docker $USER
      id $USER
      ```

20. **Test Dockerfile on EC2:**
    - Test the Dockerfile on the EC2 instance using the following commands:
      ```bash
      docker build -t my-python-app:1.0 .
      docker image ls
      docker run -p 8000:8000 my-python-app:1.0
      - Visit http://EC2-Public-IP:8000 to test.
      ```

## Additional References:

- **YouTube Tutorials:**
  - [Tutorial 1](https://www.youtube.com/watch?v=EatrtErP8JA&t=141s)
  - [Tutorial 2](https://www.youtube.com/watch?v=rz-W7-sccKk&list=PLzwfZQTGG83n4cAUzyQn-32M2GwUP7w3f)
  - [Tutorial 3](https://www.youtube.com/watch?v=DaxcmbWcdTA&list=PL6gx4Cwl9DGDYbs0jJdGefNN8eZRSwWqy&index=2)

- **Poetry References:**
  - [Utilizing Poetry for Managing Python Project Requirements](https://awstip.com/utilizing-poetry-for-managing-python-project-requirements-b911245d3aa2)
  - [Setting up a Django Project with Docker and Poetry](https://awstip.com/setting-up-a-django-project-with-docker-and-poetry-f391d6cde2cf)

- **Docker Install References:**
  - [Step-by-Step Guide to Install Docker on Ubuntu in AWS](https://medium.com/@srijaanaparthy/step-by-step-guide-to-install-docker-on-ubuntu-in-aws-a39746e5a63d)
  - [How to Install Docker on AWS EC2 Ubuntu 22.04 or 20.04 Linux](https://linux.how2shout.com/how-to-install-docker-on-aws-ec2-ubuntu-22-04-or-20-04-linux/)
