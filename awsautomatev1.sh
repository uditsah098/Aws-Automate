
#!/bin/bash

################################################
#					       #
# bash-scripting to automate the whole process # 
#	auto checking the ec2 instances, s3..  #
#		aws-automatev1		       #
#					       #
#                                              #
################################################

set +x

echo "----- checking ec2 instances id -----"

aws ec2 describe-instances | jq ".Reservations[].Instances[].InstanceId"

echo "----- checking s3 bucket list ------"

s3list=$(aws s3 ls)
if [ $s3list ];then
   echo "$s3list"
else 
   echo "not fount s3 lists"
fi
echo "----- checking lambda list -----"

aws lambda list-functions

echo "----- checking IAM users -----"

aws iam list-users


