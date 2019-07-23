module "shared_svc_rg"{
    source = "./modules/resourcegroup"
    resource_group = var.sharedsvc-resource_group
    tags = var.hub-tags
}

module "hub_network"{
    source = "./modules/network"
    tags  = var.hub-tags
    vnet = var.hub-vnet
    subnet_numbers = var.hub-subnet_numbers
    resource_group = module.shared_svc_rg.rg
    }

# module "spoke_network"{
#     source = "./modules/network"
#     resource_group = "${var.spoke-resource_group}"
#     tags  = "${var.spoke-tags}"
#     vnet = "${var.spoke-vnet}"
#     subnet_numbers = "${var.spoke-subnet_numbers}"
# }


 module "nsg"{
    source = "./modules/nsg"
    nsg = var.hub-nsg
    tags  = var.hub-tags
    vnet_subnet_id = lookup(module.hub_network.vnet_subnets,"ext-dmz","aabbccddee")
    resource_group = module.shared_svc_rg.rg
}



module "vm"{
    source = "./modules/compute/windows"
    resource_group =  module.shared_svc_rg.rg
    vmprofile = var.vmprofile
    os_image = var.os_image
    os_profile = var.os_profile
    vm_subnet_id = lookup(module.hub_network.vnet_subnets,"shared-svc","aabbccddee")
} 