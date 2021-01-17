# terraform-aws-iam-group

![Terraform](assets/terraform-icon.png)

This repo is a pattern to create the necessary components for instantiating an AWS group with a specific ARN policy associated to it. The makefile holds the automation logic to create the infrastructure. For convenience, this repo provides a Docker-based Terraform instance, and associated Terraform modules, for provisioning an AWS group. All components of this repo utilize semantic versioning to provide transparency, auditability, as well as improve reproducibility.

## Terraform Pattern Dependencies

This pattern expects an AWS backend created to persist the statefile after the Terraform process. If one is not created, reference see the repo [bryannice/terraform-aws-backend](https://github.com/bryannice/terraform-aws-backend) to implement.

## Terraform Environment

Execute the command below create an environment to interact with the Terraform Command Line Interface (Terraform CLI).

```makefile
make cli
```

## Make Targets to Provision (aka "create") or Deprovision (aka "destroy") An AWS Group

Below are the main make targets for provisioning and deprovisioning a group.  There are other make targets and to see them, open the makefile. Before executing make targets within the Terraform container, these environment variables must be set. Set values to these variables to control the provisioning behavior. 

| Environment Variable  | Required | Description                                                                          |
| --------------------- | ---------| ------------------------------------------------------------------------------------ |
| AWS_ACCESS_KEY_ID     | Y        | This is the AWS access key.                                                          |
| AWS_DEFAULT_OUTPUT    | Y        | Specifies the output format to use.                                                  |
| AWS_DEFAULT_REGION    | Y        | This is the AWS region.                                                              |
| AWS_SECRET_ACCESS_KEY | Y        | This is the AWS secret key.                                                          |
| GROUP_NAME            | N        | Name of the group to create (defaults to <GIT_REPOSITORY_NAME>).                     |
| POLICY_ARN            | N        | ARN policy to associate to the group (defaults to arn:aws:iam::aws:policy/ReadOnlyAccess). |
| S3_BUCKET_NAME        | N        | Name of the bucket for backend (defaults to bryannice-terraform-aws-backend). |

To create backend using a container to execute the following:

```makefile
make \
    AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID> \
    AWS_DEFAULT_OUTPUT=<AWS_DEFAULT_OUTPUT> \
    AWS_DEFAULT_REGION=<AWS_DEFAULT_REGION> \
    AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY> \
    GROUP_NAME=<GROUP_NAME> \
    POLICY_ARN=<POLICY_ARN> \
    S3_BUCKET_NAME=<S3_BUCKET_NAME> \
    provision
```

To destroy backend using a container to execute the following:

```makefile
make \
    AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID> \
    AWS_DEFAULT_OUTPUT=<AWS_DEFAULT_OUTPUT> \
    AWS_DEFAULT_REGION=<AWS_DEFAULT_REGION> \
    AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY> \
    GROUP_NAME=<GROUP_NAME> \
    POLICY_ARN=<POLICY_ARN> \
    S3_BUCKET_NAME=<S3_BUCKET_NAME> \
    provision
```

## References

* [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html#jf_administrator)
* [How to Create Reusable Infrastructure with Terraform Modules](https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d)
* [How to Manage Terraform State](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa)
* [Semantic Versioning 2.0.0](https://semver.org/)
* [State Management with Terraform](https://medium.com/@mitesh_shamra/state-management-with-terraform-9f13497e54cf)
* [Terraform CLI](https://www.terraform.io/docs/cli-index.html)
* [Terraform Tips & Tricks: Loops, If Statements, and Gotchas](https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9)

## License

[GPLv3](LICENSE)
