vpc_cidr="10.0.0.0/16"

region="us-east-1"

subnets_details=[

{
    name="public",
    cidr="10.0.1.0/24",
    type="public",
    availability_zone = "us-east-1a"
},
{
    name="public2",
    cidr="10.0.2.0/24",
    type="public",
    availability_zone = "us-east-1b"
},


{
    name="private1",
    cidr="10.0.3.0/24",
    type="private",
    availability_zone = "us-east-1a"
},

{
    name="private2",
    cidr="10.0.4.0/24",
    type="private",
    availability_zone = "us-east-1b"
    
},

]

ec2_details ={

    ami="ami-04b70fa74e45c3917",
    type="t2.micro",
    key_name="tf-key-pair"

}