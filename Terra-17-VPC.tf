provider "aws"{
    region = "ap-south-1"
}

resource "aws_vpc" "main"{
		cidr_block = "10.0.0.0/16"
		tags{
		Name = "My_vpc"
		}
}

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.main.id
		tags{
		Name = "igw"
		}
}

resource "aws_subnet" "public"{
		vpc_id = aws_vpc.main.id
		
		cidr_block = "10.1.0.0/24"
		availability_zone = "ap-south-1a"
		map_public_ip_on_launch = true
		tags{
		Name: public
		}
}

resource "aws_route_table" "publicrt"{
	vpc_id = aws_vpc.main.id
	routes{
	cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.igw.id
    }
		tags{
		Name = "publicrt"	
		}
	}

resource "aws_route_table_association" "publicassoc"{
		route_table_id = aws_route_table.publicrt.id
		subnet_id = aws_subnet.public.id
}
}
