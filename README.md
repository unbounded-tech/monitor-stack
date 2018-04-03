# monitor stack

before forking, create the following environment variables in Jenkins:

## `monitorDomain`
Example: `monitor.unbounded.tech`

Note: When adding a stack that uses a new domain name, it's recommened to configure the DNS before
deploying to avoid DNS caching issues on your local machine. This occurs when you attempt
to go to a domain before the DNS for it has been configured. The unconfigured resolution will
can get cached on your router or computer, which technically doesn't cause issues for anyone
but you, but it is annoying!

## auto-scaling setup

1. Create new incoming webhook in Slack
put into alertmanager_config

2. To get metrics, like response time, from HAProxy, we need to
create a dfp_stats_admin secret, and dfp_stats_pass secret
  - modify proxy to have access to dfp_stats_user and dfp_stats_admin

3. Deploy secrets and proxy

4. Create a new IAM user in AWS named `docker-scaler` with policies:
```
cloudformation:*, sqs:*, iam:*, ec2:*, lambda:*, dynamodb:*, autoscaling:*, elasticfilesystem:*
```

4. Create new docker-scaler-secrets repo with file `aws`
use the following contents, and fill in the missing values
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

5. In Jenkins, add the following env vars:
`workerASG`, `managerASG`, `awsDefaultRegion`