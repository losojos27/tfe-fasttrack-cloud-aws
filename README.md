# tfe-fasttrack-cloud-aws

for use with the Cloud Provider Credentials exercise

- **If you use a region other than `us-west-2`**, you will also need to change your `ami`, since AMI IDs are region-specific. Choose an AMI ID specific to your region by following [these instructions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html#finding-quick-start-ami), and modify `main.tf` with this ID. Then re-run `terraform apply`.
    
- **If you do not have a default VPC in your AWS account in the correct region**, navigate to the AWS VPC Dashboard in the web UI, create a new VPC in your region, and associate a subnet and security group to that VPC. Then add the security group ID (`vpc_security_group_ids`) and subnet ID (`subnet_id`) arguments to your `aws_instance` resource, and replace the values with the ones from your new security group and subnet.
    
   ```diff
     resource "aws_instance" "app_server" {
       ami                    = "ami-830c94e3"
       instance_type          = "t2.micro"
    +  vpc_security_group_ids = ["sg-0077..."]
    +  subnet_id              = "subnet-923a..."
     }
    ```
    
- Save the changes to `main.tf`, and re-run `terraform apply`.
