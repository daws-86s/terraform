variable "instances" {
    default = [ "mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend" ]
}

variable "zone_id" {
    default = "Z0948150OFPSYTNVYZOY"
}

variable "domain_name" {
    default = "daws86s.fun"
}