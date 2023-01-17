

Sometimes when you deploy a instance in every region using the availability zones for loop, the output from the apply will fail and say for example the instance type you are trying to deploy is not supported for a particular region.
For this case you would need to build a utility tool that says give us the availability zone list in a particular region where our desired EC2 instance type is supported, hence exluding the out the availability zone that is not supported before making the changes and doing the apply.