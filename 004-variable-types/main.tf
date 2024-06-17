# Primitive types: string, number, bool
variable "string_var" {
  description = "This is a string variable"
  type        = string
  default     = "Hello, World!"
}

variable "number_var" {
  description = "This is a number variable"
  type        = number
  default     = 42
}

variable "bool_var" {
  description = "This is a boolean variable"
  type        = bool
  default     = false
}

# Collection types: list/tuple, map/object, set
variable "list_var" {
  description = "This is a list variable"
  type        = list(string)
  default     = ["apple", "banana", "cherry", "cherry"]
}

variable "set_var" {
  description = "A set variable"
  type        = set(string)
  default     = ["apple", "banana", "banana", "banana"]
}

variable "map_var" {
  description = "This is a map variable"
  type        = map(string)
  default     = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "object_var" {
  description = "This is an object variable"
  type = object({
    name = string
    age  = number
  })
  default = {
    name = "ABC"
    age  = 123
  }
}


# Output variables
output "string_output" {
  value = var.string_var
}

output "number_output" {
  value = var.number_var
}

output "bool_output" {
  value = var.bool_var
}

output "list_output" {
  value = var.list_var
}

output "map_output" {
  value = var.map_var
}

output "object_output" {
  value = var.object_var
}

output "set_output" {
  value = var.set_var
}