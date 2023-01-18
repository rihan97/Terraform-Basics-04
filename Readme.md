# Utility Checker to see which Availability Zones accept the instance type

### Three different versions: -
#### A basic check in file c2-v1
#### A semi dynamic check in file c2-v2
#### A super dynamic way to check in file c2-v2


Sometimes when you deploy a EC2 instance in every region using the availability zones for_each loop, the output from the apply will fail and say for example the instance type you are trying to deploy in eu-west-2c is not supported.
In this case you would need to build a utility checker tool that says give us the availability zone list in a particular region where our desired EC2 instance type are supported, hence exluding  out the availability zone before hand ensures that the terraform apply will succeed, 


