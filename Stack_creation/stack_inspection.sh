aws cloudformation describe-stacks --stack-name "nginx-Web-Server" --query "Stacks[0].StackStatus" # Expected output : "CREATE_IN_PROGRESS", "CREATE_COMPLETE"
aws cloudformation describe-stacks --stack-name "nginx-Web-Server" --query "Stacks[0].Outputs" # Example output : 
#[
#    {
#        "OutputKey": "Website",
#        "OutputValue": "http://54.90.223.65",
#        "Description": "URL to site"
#    }
#]
