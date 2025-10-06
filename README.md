# AWS Continuous Integration and Continuous Deployment Demo

This guide walks you through setting up a full CI/CD pipeline for your Python Flask Docker app using GitHub, AWS CodePipeline, AWS CodeBuild, and AWS CodeDeploy.

---

## 1. Set Up GitHub Repository

The first step in our CI/CD journey is to set up a GitHub repository to store our Python application's source code. If you already have a repository, feel free to skip this step. Otherwise, let's create a new repository on GitHub by following these steps:

1. Go to [github.com](https://github.com) and sign in to your account.  
2. Click on the "+" button in the top-right corner and select **New repository**.  
3. Give your repository a name and an optional description.  
4. Choose the appropriate visibility option based on your needs.  
5. Initialize the repository with a README file.  
6. Click on the **Create repository** button to create your new GitHub repository.

Great! Now that we have our repository set up, we can move on to the next step.

---

## 2. Create an AWS CodePipeline

In this step, we'll create an AWS CodePipeline to automate the continuous integration and deployment process for our Python application. AWS CodePipeline will orchestrate the flow of changes from our GitHub repository to deployment using CodeBuild and CodeDeploy.

Let's go ahead and set it up:

1. Go to the AWS Management Console and navigate to the **AWS CodePipeline** service.  
2. Click on the **Create pipeline** button.  
3. Provide a name for your pipeline and click on the **Next** button.  
4. For the **Source** stage, select **GitHub** as the source provider.  
5. Connect your GitHub account to AWS CodePipeline and select your repository.  
6. Choose the branch you want to use for your pipeline.  
7. In the **Build** stage, select **AWS CodeBuild** as the build provider.  
8. Create a new CodeBuild project by clicking on the **Create project** button.  
9. Configure the CodeBuild project with the necessary settings for your Python application, such as the build environment, build commands, and artifacts.  
10. Save the CodeBuild project and go back to CodePipeline.  
11. In the **Deploy** stage, select **AWS CodeDeploy** as the deployment provider.  
12. Choose or create a CodeDeploy application and deployment group configured for your EC2 instances or ECS cluster.  
13. Review the pipeline configuration and click on the **Create pipeline** button to create your AWS CodePipeline.

Awesome job! We now have our pipeline ready to roll. Let's move on to the next step to set up AWS CodeBuild.

---

## 3. Configure AWS CodeBuild

In this step, we'll configure AWS CodeBuild to build our Python application based on the specifications we define. CodeBuild will take care of building and packaging our application for deployment.

Follow these steps:

1. In the AWS Management Console, navigate to the **AWS CodeBuild** service.  
2. Click on the **Create build project** button.  
3. Provide a name for your build project.  
4. For the source provider, choose **AWS CodePipeline**.  
5. Select the pipeline you created in the previous step.  
6. Configure the build environment, such as the operating system, runtime, and compute resources required for your Python application.  
7. Specify the build commands, such as installing dependencies, building your Docker image, and running tests. Customize this based on your application's requirements.  
8. Set up the artifacts configuration to generate the build output required for deployment (for example, Docker image tags or deployment scripts).  
9. Review the build project settings and click on the **Create build project** button to create your AWS CodeBuild project.

Fantastic! With AWS CodeBuild all set up, we're now ready to witness the magic of continuous integration in action.

---

## 4. Configure AWS CodeDeploy

AWS CodeDeploy will handle deploying your Docker container to your EC2 instances or ECS cluster.

- Set up a **CodeDeploy Application** and **Deployment Group** in the AWS Console.  
- The deployment group should target your deployment environment (e.g., specific EC2 instances or an ECS service).  
- Use an `appspec.yml` file in your repository to define deployment hooks and lifecycle events.  
- Include deployment scripts (like `start_container.sh` and `stop_container.sh`) to manage your Docker containers during deployment.  
- Ensure your EC2 instances or containers have the CodeDeploy agent installed and running.  
- CodePipeline will use CodeDeploy in the deploy stage to execute these scripts and update your running app with the new Docker image.

---

## 5. Trigger the CI/CD Pipeline

In this final step, we'll trigger the CI/CD process by making a change to our GitHub repository. Let's see how it works:

1. Go to your GitHub repository and make a change to your Python application's source code. It could be a bug fix, a new feature, or any other update.  
2. Commit and push your changes to the branch configured in your AWS CodePipeline.  
3. Head over to the AWS CodePipeline console and navigate to your pipeline.  
4. You should see the pipeline automatically kick off as soon as it detects the changes in your repository.  
5. Sit back and relax while AWS CodePipeline takes care of the rest:  
   - It fetches the latest code from GitHub.  
   - Triggers the build process with AWS CodeBuild.  
   - Deploys the updated Docker container using AWS CodeDeploy.

Congratulations! Your Flask Docker application is now continuously integrated and deployed with every code change.
