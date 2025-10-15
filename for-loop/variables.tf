variable "instances" {
    default = [ "mongodb", "redis"]
    # default = {
    #     mongodb = "t3.micro"
    #     redis = "t3.micro"
    #     mysql = "t3.small"
    # }
    # default = {
    #     mongodb = {
    #         instance_type = "t3.micro"
    #         ami = "ami-id"
    #     }
    #     redis = "t3.micro"
    #     mysql = "t3.small"
    # }
}

variable "zone_id" {
    default = "Z0948150OFPSYTNVYZOY"
}

variable "domain_name" {
    default = "daws86s.fun"
}