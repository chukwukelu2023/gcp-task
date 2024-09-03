variable "project-id" {
  type        = string
  description = "The project id in gcp cloud"
}

variable "region" {
  type        = string
  description = "The region where resources will be deployed"
}

variable "project_service" {
  type        = map(string)
  description = "(Required)The names of the Google Platform project service."
}

variable "compute_network_name" {
  type        = string
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}

variable "compute_network_description" {
  type        = string
  description = "(Optional) An optional description of this resource. The resource must be recreated to modify this field."
  default     = null
}

variable "compute_network_routing" {
  type        = string
  description = "(Optional) The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are: REGIONAL, GLOBAL."
}

variable "compute_network_subnets" {
  type        = bool
  description = "(Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
}

variable "compute_network_mtu" {
  type        = number
  description = "Maximum Transmission Unit in bytes. The default value is 1460 bytes. The minimum value for this field is 1300 and the maximum value is 8896 bytes (jumbo frames). Note that packets larger than 1500 bytes (standard Ethernet) can be subject to TCP-MSS clamping or dropped with an ICMP Fragmentation-Needed message if the packets are routed to the Internet or other VPCs with varying MTUs."
}

variable "compute_network_default_routes" {
  type        = bool
  description = "(Optional) If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false."
}

variable "compute_subnetwork_name" {
  type        = string
  description = "(Required) The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}

variable "compute_subnetwork_cidr" {
  type        = string
  description = "(Optional) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported. Field is optional when reserved_internal_range is defined, otherwise required."
}

variable "compute_network_ip_google_access" {
  type        = bool
  description = "(Optional) When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
}

variable "compute_network_secondary_ip" {
  type = list(object({
    ip_cidr_range = string
    range_name    = string
  }))
  description = "(Optional) An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges."
}

variable "compute_router_name" {
  type        = string
  description = "(Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}

variable "compute_router_nat_name" {
  type        = string
  description = "(Required) Name of the NAT service. The name must be 1-63 characters long and comply with RFC1035."
}

variable "compute_router_nat_subnet_ip" {
  type        = string
  description = "(Required) How NAT should be configured per Subnetwork. If ALL_SUBNETWORKS_ALL_IP_RANGES, all of the IP ranges in every Subnetwork are allowed to Nat. If ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, all of the primary IP ranges in every Subnetwork are allowed to Nat. LIST_OF_SUBNETWORKS: A list of Subnetworks are allowed to Nat (specified in the field subnetwork below). Note that if this field contains ALL_SUBNETWORKS_ALL_IP_RANGES or ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, then there should not be any other RouterNat section in any Router for this network in this region. Possible values are: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS."
}

variable "compute_router_nat_ip_allocation" {
  type        = string
  description = "(Optional) How external IPs should be allocated for this NAT. Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform, or MANUAL_ONLY for only user-allocated NAT IP addresses. Possible values are: MANUAL_ONLY, AUTO_ONLY."
}

variable "compute_router_nat_source_ip_range" {
  type        = list(string)
  description = " (Required) List of options for which source IPs in the subnetwork should have NAT enabled. Supported values include: ALL_IP_RANGES, LIST_OF_SECONDARY_IP_RANGES, PRIMARY_IP_RANGE."
}

variable "compute_address_name" {
  type        = string
  description = "(Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}

variable "compute_address_type" {
  type        = string
  description = "The type of address to reserve. Note: if you set this argument's value as INTERNAL you need to leave the network_tier argument unset in that resource block. Default value is EXTERNAL. Possible values are: INTERNAL, EXTERNAL."
}

variable "compute_address_description" {
  type        = string
  description = "(Optional) An optional description of this resource."
  default     = null
}

variable "compute_address_tier" {
  type        = string
  description = "(Optional) The networking tier used for configuring this address. If this field is not specified, it is assumed to be PREMIUM. This argument should not be used when configuring Internal addresses, because network tier cannot be set for internal traffic; it's always Premium. Possible values are: PREMIUM, STANDARD."
}

variable "compute_firewall_name" {
  type        = string
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
}

variable "compute_firewall_protocol" {
  type        = string
  description = "(Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp, ipip, all), or the IP protocol number."
}

variable "compute_firewall_ports" {
  type        = list(string)
  description = "(Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port."
}

variable "compute_firewall_source_range" {
  type        = list(string)
  description = "(Optional) If source tags are specified, the firewall will apply only to traffic with source IP that belongs to a tag listed in source tags. Source tags cannot be used to control traffic to an instance's external IP address. Because tags are associated with an instance, not an IP address. One or both of sourceRanges and sourceTags may be set. If both properties are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP that belongs to a tag listed in the sourceTags property. The connection does not need to match both properties for the firewall to apply. For INGRESS traffic, one of source_ranges, source_tags or source_service_accounts is required."
}

variable "container_cluster_name" {
  type        = string
  description = "(Required) The name of the cluster, unique within the project and location."
}

variable "container_cluster_remove_node_pool" {
  type        = bool
  description = "(Optional) If true, deletes the default node pool upon cluster creation. If you're using google_container_node_pool resources with no default node pool, this should be set to true, alongside setting initial_node_count to at least 1."
}

variable "container_cluster_initial_node_count" {
  type        = number
  description = " (Optional) The number of nodes to create in this cluster's default node pool. In regional or multi-zonal clusters, this is the number of nodes per zone. Must be set if node_pool is not set. If you're using google_container_node_pool objects with no default node pool, you'll need to set this to a value of at least 1, alongside setting remove_default_node_pool to true."
}

variable "container_cluster_deletion_protection" {
  type        = bool
  description = "(Optional) Whether or not to allow Terraform to destroy the cluster. Unless this field is set to false in Terraform state, a terraform destroy or terraform apply that would delete the cluster will fail."
}

variable "container_cluster_network_mode" {
  type        = string
  description = "(Optional) Determines whether alias IPs or routes will be used for pod IPs in the cluster. Options are VPC_NATIVE or ROUTES. VPC_NATIVE enables IP aliasing. Newly created clusters will default to VPC_NATIVE."
}

variable "container_cluster_http_balancing" {
  type        = bool
  description = "(Optional) The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster. It is enabled by default; set disabled = true to disable."
}

variable "container_cluster_hpa" {
  type        = bool
  description = "(Optional) The status of the Horizontal Pod Autoscaling addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods. It is enabled by default; set disabled = true to disable."
}

variable "container_cluster_release_chanel" {
  type        = string
  description = " (Optional) Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters. When updating this field, GKE imposes specific version requirements"
}

variable "container_cluster_secondary_range" {
  type        = string
  description = "(Optional) The name of the existing secondary range in the cluster's subnetwork to use for pod IP addresses. Alternatively, cluster_ipv4_cidr_block can be used to automatically create a GKE-managed one."
}

variable "container_services_secondary_range" {
  type        = string
  description = "(Optional) The name of the existing secondary range in the cluster's subnetwork to use for service ClusterIPs. Alternatively, services_ipv4_cidr_block can be used to automatically create a GKE-managed one."
}

variable "cluster_enable_private_nodes" {
  type        = bool
  description = "(Optional) - Enables the private cluster feature, creating a private endpoint on the cluster. In a private cluster, nodes only have RFC 1918 private addresses and communicate with the master's private endpoint via private networking"
}

variable "cluster_enable_private_endpoint" {
  type        = bool
  description = "(Optional) - When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled. When false, either endpoint can be used. This field only applies to private clusters, when enable_private_nodes is true."
}

variable "cluster_master_cidr" {
  type        = string
  description = "(Optional) - The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning private IP addresses to the cluster master(s) and the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network, and it must be a /28 subnet. See Private Cluster Limitations for more details. This field only applies to private clusters, when enable_private_nodes is true."
}

variable "node_pool_name" {
  type        = string
  description = "(Optional) The name of the node pool. If left blank, Terraform will auto-generate a unique name."
}

variable "node_pool_count" {
  type        = number
  description = "(Optional) The number of nodes per instance group. This field can be used to update the number of nodes per instance group but should not be used alongside autoscaling."
}

variable "node_pool_auto_repair" {
  type        = bool
  description = "(Optional) Whether the nodes will be automatically repaired. Enabled by default."
}

variable "node_pool_auto_upgrade" {
  type        = bool
  description = "(Optional) Whether the nodes will be automatically upgraded. Enabled by default."
}

variable "node_pool_min" {
  type        = number
  description = " (Optional) Minimum number of nodes per zone in the NodePool. Must be >=0 and <= max_node_count. Cannot be used with total limits."
}

variable "node_pool_max" {
  type        = number
  description = "(Optional) Maximum number of nodes per zone in the NodePool. Must be >= min_node_count. Cannot be used with total limits."
}

variable "node_pool_oauth_scope" {
  type = list(string)
}

variable "node_pool_preemtible" {
  type    = bool
  default = false
}

variable "node_pool_machine_size" {
  type        = string
  description = "The size of the compute engine"
}

variable "spot_node_pool_label" {
  type = map(string)
}

variable "general_node_pool_label" {
  type = map(string)
}

variable "node_pool_taint_key" {
  type = string
}

variable "node_pool_taint_value" {
  type = string
}

variable "node_pool_taint_effect" {
  type = string
}

variable "service_account_id" {
  type        = string
  description = "(Required) The Google service account ID. This be one of:The name of the service account within the project "
}