#!/usr/bin/python3
import boto3
import cgi
import cgitb
import os
from awscred import access_key , secret_access_key

q = cgi.FieldStorage()
cmd = q.getvalue('x')
listmax = 30 
# listmax is used to set the no of items to display in a list

client = boto3.client('ec2', region_name="ap-south-1",  aws_access_key_id=access_key, aws_secret_access_key=secret_access_key)
cgitb.enable()

print('content-type:text/html')
print()

# list all keypairs
if cmd == "listkp":
    res = client.describe_key_pairs()
    for keys in res['KeyPairs']:
        print(" KeyName: {}".format(keys['KeyName']))
        print()

# list all instances
elif cmd == "listins":
    res = client.describe_instances() 
    inslist = res['Reservations']
    if len(inslist)!=0 :
        inslist = inslist[0]['Instances']
        for ins in inslist:
            # print(ins)
            # ins = ins['Instances']
            if ins['State']['Name']  == 'running':
                     print(""" Instance Id : {} Image Id : {} \n Private ipv4 : {} Public ipv4 : {} \n state : {} \n VPC Id : {} Subnet Id : {} \n SecurityGroups : {}""".format(ins['InstanceId'],ins['ImageId'],ins['PrivateIpAddress'],ins['PublicIpAddress'],ins['State']['Name'],ins['VpcId'],ins['SubnetId'],ins['SecurityGroups']))
                     print()
            elif ins['State']['Name'] == 'stopped': 
                     print(""" Instance Id : {} Image Id : {}\n state : {} \n VPC Id : {} Subnet Id : {} \n SecurityGroups : {}""".format(ins['InstanceId'],ins['ImageId'],ins['State']['Name'],ins['VpcId'],ins['SubnetId'],ins['SecurityGroups']))
                     print()
            else:
                     print("no instances available")
    else: 
        print("No Instances")

# list security Groups
elif cmd == "listsg":
    res = client.describe_security_groups()
    sglist = res['SecurityGroups']
    if len(sglist)!= 0:
        for sg in sglist:
            print(" GroupName : {} \n Description : {} \n Rules : \n {}".format(sg['GroupName'],sg['Description'],sg['IpPermissions']))
            print()

# list images
elif cmd == "listimg":
    res = client.describe_images(Owners=['amazon'])
    imglist = res['Images'][0:listmax]
    for img in imglist:
        print(" ImageId : {}\n Name : {}".format(img['ImageId'],img['Name']))
        print()

# list volumes
elif cmd == "listvol":
    res = client.describe_volumes()
    vollist = res['Volumes']
    if len(vollist)!=0:
        for vol in vollist:
            print(" Volume Id : {} Size : {} \n State : {} Encrypted : {} \n Availability Zone : {}\n".format(vol['VolumeId'],vol['Size'],vol['State'],vol['Encrypted'],vol['AvailabilityZone']))
    else: 
        print("No Volumes created")

# create an instance 
elif cmd == "createins":
    res =  client.run_instances(
    BlockDeviceMappings=[
        {
            'DeviceName': '/dev/sdh',
            'Ebs': {
                'VolumeSize': 100,
            },
        },
    ],
    ImageId='ami-04b1ddd35fd71475a',
    InstanceType='t2.micro',
    KeyName='mykey1',
    MaxCount=1,
    MinCount=1,
    TagSpecifications=[
        {
            'ResourceType': 'instance',
            'Tags': [
                {
                    'Key': 'Purpose',
                    'Value': 'test',
                },
                     ],
             },
         ],
    )

# list vpcs
elif cmd == "listvpcs":
    res = client.describe_vpcs(MaxResults=6)
    print(res["Vpcs"][0]["VpcId"])
    print(res["Vpcs"][0]["CidrBlock"])

# remove instances
elif cmd == "rmins":
    response = client.describe_instances(
    Filters=[
        {
            'Name': 'tag:Purpose',
            'Values': [
                'test',
            ]
        }   ])
    insid = response["Reservations"][0]["Instances"][0]["InstanceId"]
    res = client.terminate_instances(
    InstanceIds=[
        insid,
    ],)
    print("Instance removed Successfully")

else:
    print("Select proper option")
