Here's how you can output that value in your root module:

First, define the child module and call it in your root module.

In your child module (located at ./modules/network), you might have something like this:

```
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
```

Then, in your root module, you can output the `vnet_id` like this:
```
output "vnet_id" {
  value = module.network.vnet_id
  description = "The ID of the virtual network"
}
```
In this example, `vnet_id` is the name of the output, `module.network.vnet_id` is the value of the output, and description is an optional field that describes what the output is.



