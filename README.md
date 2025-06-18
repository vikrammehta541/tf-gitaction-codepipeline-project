Prerequisites
Before creating the pipeline, make sure you have the following:

1. GitHub Repository
A GitHub repo containing your Terraform code.
Example structure:
aws-ec2-terraform-pipeline/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── buildspec.yml
2. S3 Bucket for Artifacts
Create an S3 bucket to store pipeline artifacts:
Go to S3 Console → Create bucket
Name it something like my-codepipeline-artifacts
Enable versioning (recommended)
3. AWS CodeBuild Project (Optional but recommended)
Go to CodeBuild Console → Create build project
Name: TerraformEC2Build
Environment:
Managed image: Ubuntu, standard image
Runtime: Terraform (install via buildspec.yml)
Source: GitHub (same repo)
Buildspec:

4. IAM Roles
a. CodePipeline Role
Go to IAM Console → Roles → Create role
Trusted entity: CodePipeline
Attach policies:
AmazonS3FullAccess
AWSCodeBuildDeveloperAccess
AWSCodePipelineFullAccess
b. CodeBuild Role
Go to IAM Console → Roles → Create role
Trusted entity: CodeBuild
Attach policies:
AmazonEC2FullAccess
AmazonS3FullAccess
AmazonSSMFullAccess (if using SSM)
CloudWatchLogsFullAccess
🛠️ Create CodePipeline via AWS Console
Step 1: Open CodePipeline Console
Go to AWS CodePipeline Console
Click “Create pipeline”
Step 2: Pipeline Settings
Name: TerraformEC2Pipeline
Service role: Choose existing or create new
Artifact store: Select your S3 bucket
Step 3: Add Source Stage
Source provider: GitHub (Version 2)
Connect your GitHub account
Select your repo and branch (e.g., main)
Choose GitHub webhooks for automatic triggers
Step 4: Add Build Stage
Build provider: AWS CodeBuild
Select your TerraformEC2Build project
Step 5: Skip Deploy Stage (Optional)
You can skip this if Terraform is handling infrastructure provisioning
Step 6: Review and Create
Review all settings
Click Create pipeline
