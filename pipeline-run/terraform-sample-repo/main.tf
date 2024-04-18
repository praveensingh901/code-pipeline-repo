
module "codepipeline_terraform" {
  source             = "./env/generic"
  project_name       = "microservice-project"
  environment        = "dev"
  source_repo_name   = "microservice-repo"
  source_repo_branch = "main"
  create_new_repo    = true
  repo_approvers_arn = "arn:aws:sts::637423306572:assumed-role/CodeCommitReview/*" #Update ARN (IAM Role/User/Group) of Approval Members
  create_new_role    = true
  #codepipeline_iam_role_name = <Role name> - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
#  codepipeline_iam_role_name =  tf-validate-project-codepipeline-role # - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
  stage_input = [
    { name = "validate", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ValidateOutput" },
    { name = "plan", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "ValidateOutput", output_artifacts = "PlanOutput" },
    { name = "ManualApproval", category = "Approval", owner = "AWS", provider = "Manual", input_artifacts = "", output_artifacts = "" },
    { name = "apply", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "PlanOutput", output_artifacts = "ApplyOutput" }
  ]
  build_projects = ["validate", "plan", "apply"]
}


module "codepipeline_terraform_sit" {
  source             = "./env/generic"
  project_name       = "microservice-project-sit"
  environment        = "sit"
  source_repo_name   = "microservice-repo-sit"
  source_repo_branch = "main"
  create_new_repo    = true
  repo_approvers_arn = "arn:aws:sts::637423306572:assumed-role/CodeCommitReview/*" #Update ARN (IAM Role/User/Group) of Approval Members
  create_new_role    = true
  #codepipeline_iam_role_name = <Role name> - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
#  codepipeline_iam_role_name =  tf-validate-project-codepipeline-role # - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
  stage_input = [
    { name = "validate", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ValidateOutput" },
    { name = "plan", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "ValidateOutput", output_artifacts = "PlanOutput" },
    { name = "ManualApproval", category = "Approval", owner = "AWS", provider = "Manual", input_artifacts = "", output_artifacts = "" },
    { name = "apply", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "PlanOutput", output_artifacts = "ApplyOutput" }
  ]
  build_projects = ["validate", "plan", "apply"]
}

module "codepipeline_terraform_uat" {
  source             = "./env/generic"
  project_name       = "microservice-project-uat"
  environment        = "uat"
  source_repo_name   = "microservice-repo-uat"
  source_repo_branch = "main"
  create_new_repo    = true
  repo_approvers_arn = "arn:aws:sts::637423306572:assumed-role/CodeCommitReview/*" #Update ARN (IAM Role/User/Group) of Approval Members
  create_new_role    = true
  #codepipeline_iam_role_name = <Role name> - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
#  codepipeline_iam_role_name =  tf-validate-project-codepipeline-role # - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
  stage_input = [
    { name = "validate", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ValidateOutput" },
    { name = "plan", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "ValidateOutput", output_artifacts = "PlanOutput" },
    { name = "ManualApproval", category = "Approval", owner = "AWS", provider = "Manual", input_artifacts = "", output_artifacts = "" },
    { name = "apply", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "PlanOutput", output_artifacts = "ApplyOutput" }
  ]
  build_projects = ["validate", "plan", "apply"]
}
