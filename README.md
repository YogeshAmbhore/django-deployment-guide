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

10. **Install Project Requirements:**
    - Install all project requirements.

11. **Configure Security Group:**
    - Update the security group to allow requests on port 8000.
      - Settings => Custom TCP   8000   Anywhere   0.0.0.0

12. **Run the Django Server:**
    - Execute the following command to run the Django server:
      ```
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
      ```
      docker build -t my-python-app:1.0 .
      docker image ls
      docker run -p 8000:8000 my-python-app:1.0
      ```
      - Visit http://localhost:8000 to test.

16. **Push Dockerfile Code to Repo:**
    - Commit and push the Dockerfile code to the Git repository.

17. **Merge Code:**
    - Merge the Dockerfile code into the main branch.

18. **Pull Updated Code on EC2:**
    - SSH into the EC2 instance and pull the updated code.

19. **Test Dockerfile on EC2:**
    - Test the Dockerfile on the EC2 instance using the following commands:
      ```
      docker build -t my-python-app:1.0 .
      docker image ls
      docker run -p 8000:8000 my-python-app:1.0
      ```
      - Visit http://EC2-Public-IP:8000 to test.
