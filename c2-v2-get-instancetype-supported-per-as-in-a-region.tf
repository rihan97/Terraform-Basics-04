# We will make it more dynamic is this version 2 of the Utility tool

# Datasource
data "aws_ec2_instance_type_offerings" "myec2_type2" {
    for_each = toset(["eu-west-2a", "eu-west-2b", "eu-west-2c"]) //has to be converted to a SET since for_each only accepts a map sets/
   filter {
    name = "instance-type"
    values = ["t2.micro"]
   }

   filter {
    name = "location"
    values = [each.value]  //can do each.key or each.value same thing
   }
   location_type = "availability-zone"
}

# Output-1
output "output_v2_1" {
    description = "To check if the instance type is supported in the az"
    #value = toset([for t in data.aws_ec2_instance_type_offerings.myec2_type2: t.instance_types]) //can use toset to make them of the most general type
    value = [for t in data.aws_ec2_instance_type_offerings.myec2_type2: t.instance_types]
  
}

# Output-2 using map so key = value
# create a map with key as Availability zone and value as instance type supported
output "output_v2_2" {
    description = "To check if the instance type is supported in the az"
    #value = toset([for t in data.aws_ec2_instance_type_offerings.myec2_type2: t.instance_types]) //can use toset to make them of the most general type
    value = {for az, details in data.aws_ec2_instance_type_offerings.myec2_type2: az => details.instance_types}
}
