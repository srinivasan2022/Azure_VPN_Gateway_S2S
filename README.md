# Azure_VPN_Gateway

Azure VPN Gateway is a service that can be used to send encrypted traffic between an Azure virtual network and on-premises locations over the public Internet. You can also use VPN Gateway to send encrypted traffic between Azure virtual networks over the Microsoft network. VPN Gateway uses a specific type of Azure virtual network gateway called a VPN gateway. Multiple connections can be created to the same VPN gateway. When you create multiple connections, all VPN tunnels share the available gateway bandwidth.

## Why use VPN Gateway?

Here are some of the key scenarios for VPN Gateway:

Send encrypted traffic between an Azure virtual network and on-premises locations over the public Internet. You can do this by using the following types of connections:

##### Site-to-site connection: 
A cross-premises IPsec/IKE VPN tunnel connection between the VPN gateway and an on-premises VPN device.

##### Point-to-site connection: 
VPN over OpenVPN, IKEv2, or SSTP. This type of connection lets you connect to your virtual network from a remote location, such as from a conference or from home.


## Architecture Diagram :

![VPN](Images/VPN.png)

###### Apply the Terraform configurations :

Deploy the resources using Terraform,

```
cd VPN_GW
```
```
terraform init
```
```
terraform plan
```
```
terraform apply
```
### Further Steps involved are (Azure Portal) :

- First we have to create the 3 Resource Groups named (onPrem-rg , Hub-rg , Spoke-rg).
- Create the 3 Virtual Networks (hub-vnet , onprem-vnet , spoke-vnet) in their respective resource groups.
- Create the VPN Gateway in hub-vnet and onprem-vnet .
- Create the local network gateway and connection in hub-vnet and onprem-vnet for establish the Site-to-Site connection.
- Establish the peering between hub-vnet and spoke-vnet .
- Create the Virtual Machines in onprem-vnet and spoke-vnet.
- Requirements : Connect the Spoke-network from onprem-network .