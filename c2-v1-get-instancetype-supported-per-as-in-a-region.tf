# check in the az eu-west-2a whether a t2.micro is supported

# Datasource
data "aws_ec2_instance_type_offerings" "myec2_type1" {
   filter {
    name = "instance-type"
    values = ["t2.micro"]
   }

   filter {
    name = "location"
    values = ["eu-west-2a"]
    #values = ["eu-west-2b"]
    #values = ["eu-west-2c"]
   }
   location_type = "availability-zone"
}

# so now we have the utiltiy above but how can we test if in the az's its supported? we use the outputs
# Output
output "output_v1_1" {
    description = "To check if the instance type is supported in the region"
    value =  data.aws_ec2_instance_type_offerings.myec2_type1.instance_types
  
}
