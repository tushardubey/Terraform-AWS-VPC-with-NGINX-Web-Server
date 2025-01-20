resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
}

#creating subnet
resource "aws_subnet" "private"{
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my-vpc.id
}

resource "aws_subnet" "public" {

    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my-vpc.id
}



#internet gateway
resource "aws_internet_gateway" "my-gateway" {
    vpc_id = aws_vpc.my-vpc.id
}


#routing table 
resource "aws_route_table" "routing_table" {

    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-gateway.id
    }
  
}

#route table association
resource "aws_route_table_association" "public_sub" {

    route_table_id = aws_internet_gateway.my-gateway.id
    subnet_id = aws_subnet.public.id
  
}
