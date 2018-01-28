## 创建 AWS CloudFormation 模板 
> High level Json structure.
```json
    "Description" : "模板使用方法的文本描述",
    "Parameters": {
        // 用于根据每个部署自定义模板的一组输入值
    },
    "Resources" : {
        // 一组 AWS 资源及其相互关系
    },
    "Outputs" : {
        // 堆栈创建者可以看到的一组值
    },
    "AWSTemplateFormatVersion" : "2017-09-09"
}
```
> Example
```json
{
    "Description" : "创建运行 Amazon Linux 32 位 AMI 的 EC2 实例。",
    "Parameters" : {
        "KeyPair" : {
            "Description" : "允许 SSH 访问此实例的 EC2 密钥对",
            "Type" : "String"
        }
    },
    "Resources" : {
        "Ec2Instance" : {
            "Type" : "AWS::EC2::Instance",
            "Properties" : {
                "KeyName" : { "Ref" : "KeyPair" },
                "ImageId" : "ami-3b355a52"
            }
        }
    },
    "Outputs" : {
        "InstanceId" : {
            "Description" : "新创建的 EC2 实例的实例 ID",
            "Value" : {
                "Ref" : "Ec2Instance"
            }
        }
    },
    "AWSTemplateFormatVersion" : "2010-09-09"
}
```


## 处理 AWS 资源
AWS CloudFormation 模板旨在让您能够利用 AWS 现有体验。每个资源都有一组参数，其名称与通过其原生 API 创建资源时所用的名称完全相同。下列模板片段演示如何定义 Amazon EBS 卷。模板中卷的逻辑名称为“myVolume”，其类型为 “AWS::EC2::Volume”。如果您以前使用过 EBS 卷，那么您应该对这些属性应该很熟悉。

```json
"myVolume" : {
    "Type" : "AWS::EC2::Volume",
    "Properties" : {
        "Size" : "10",
        "SnapshotId" : "snap-7b8fd361",
        "AvailabilityZone" : "us-east-1a"
    }
}
```