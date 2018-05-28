#!/bin/bash

# AWS (ECS/ECR)
AWS_REGION=""               # example: us-west-2
ECR_REPOSITORY=""           # example: 123456789012.dkr.ecr.${AWS_REGION}.amazonaws.com
ECS_CRED_PROFILE=""         # example: default (see your ~/.aws/credentials file for a profile key)
ECS_INSTANCE_VPC_ID=""      # example: vpc-1a2b3c4d
ECS_CLUSTER_NAME=""         # example: default
ELBV2_LOAD_BALANCER_NAME="" # example: "lb-ecs-internal"
ELBV2_LOAD_BALANCER_ARN=""  # example: arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/app/lb-ecs-internal/1a2b3c4d5e6f7g8h
ELBV2_HTTP_LISTENER_ARN=""  # example: arn:aws:elasticloadbalancing:us-west-2:123456789012:listener/app/lb-ecs-internal/1a2b3c4d5e6f7g8h/8h7g6f5e4d3c2b1a"

aws ecr get-login \
    --no-include-email \
    --region "${AWS_REGION}" \
    --profile "${ECS_CRED_PROFILE}" | awk '{printf $6}' | docker login -u AWS ${ECR_REPOSITORY} \
    --password-stdin > /dev/null
