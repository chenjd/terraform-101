
## Terraform 101: types of variables

![](https://cdn-images-1.medium.com/max/3840/1*Zdvdgz0FLU-5gU8edw2ikw.jpeg)

In Terraform, the type of variable you use depends on the kind of data you need to represent. Here’s a guide on when to use each type:

**Primitive Types**: These are the basic data types in Terraform.

* string: Use this when you need to represent text. For example, you might use a string to represent a resource name, a region, or an API key.

* number: Use this when you need to represent a numeric value. For example, you might use a number to represent the amount of resources to create.

* bool: Use this when you need to represent a true or false value. For example, you might use a boolean to control whether certain resources are created.

**Collection Types**: These are data types that can hold multiple values.

* list: Use this when you need an ordered collection of items of the same type. For example, you might use a list to represent the availability zones for your resources.

* set: Use this when you need an unordered collection of unique items of the same type. For example, you might use a set to represent the unique tags for your resources.

* map: Use this when you need a collection of key-value pairs. For example, you might use a map to represent the tags for your resources, where each tag is a key-value pair.

**Complex Types**: These are data types that can hold multiple values of different types.

* object({name = string, age = number}): Use this when you need a collection of named attributes with specific types. For example, you might use an object to represent a complex configuration for a resource.

Here’s an example that demonstrates the variable types:

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
      description = "This is a set variable"
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

Each variable is declared with a variable block that includes a description, a type, and a default value. The type can be any of the built-in Terraform types: string, number, bool, list, set, map, object. The default value is optional and provides a default value for the variable if one is not provided when the configuration is applied.

The variable "set_var" is a set of strings. Even though "banana" is repeated in the default value, it will only appear once in the actual set.

![](https://cdn-images-1.medium.com/max/2284/1*NHkxhv7CPWO2TLrag8bAhg.png)

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!
