# Basic-CI-CD-with-TLG-notifications
Development of a simple CI/CD for the SimpleBashUtils project. Building, testing, deployment


##### Notifications of successful/unsuccessful pipeline execution via bot named "[your nickname] DO6 CI/CD" in *Telegram*
- The text of the notification contain information on the successful passing of both **CI** and **CD** stages.
- The rest of the notification text may be arbitrary.


### **CI** basics

**CI** (Continuous Integration) refers to the integration of individual pieces of application code with each other.
**CI** normally performs two tasks as described below.

- BUILD
    - Checking if the code is being built at all
    - Prepare the artifacts for the next stages
- TEST
    - Codestyle tests
    - Unit Tests
    - Integration tests
    - Other tests you have
    - Test reports

### **CD** basics

**CD** (Continuous Delivery) is a continuous integration extension, as it automatically deploys all code changes to the test and/or production environment after the build stage.
**CD** can perform the following tasks.

- PUBLISH (If using a deployment docker)
    - Build container images
    - Push the images to where they will be taken from for deployment
- UPDATE CONFIGS
    - Update configuration on the machines
- DEPLOY STAGING
    - Deployment of test environment for manual tests, QA, and other non-automated checks
    - Can be run manually or automatically if CI stages are passed successfully
- DEPLOY PRODUCTION
    - Deploying a new version of the system on 'production'
    - This stage better be run manually rather than automatically
    - If you want, you can set it up for a specific branch of the repository only (master, release, etc.)

