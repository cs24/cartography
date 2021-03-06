# Cartography - Google Cloud Platform Schema

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [GCPOrganization](#gcporganization)
  - [Relationships](#relationships)
  - [Relationships](#relationships-1)
- [GCPBucket](#gcpbucket)
  - [Relationships](#relationships-2)
- [GCPInstance](#gcpinstance)
  - [Relationships](#relationships-3)
- [GCPNetworkTag](#gcpnetworktag)
  - [Relationships](#relationships-4)
- [GCPVpc](#gcpvpc)
  - [Relationships](#relationships-5)
- [GCPNetworkInterface](#gcpnetworkinterface)
  - [Relationships](#relationships-6)
- [GCPNicAccessConfig](#gcpnicaccessconfig)
  - [Relationships](#relationships-7)
- [GCPSubnet](#gcpsubnet)
  - [Relationships](#relationships-8)
- [GCPFirewall](#gcpfirewall)
  - [Relationships](#relationships-9)
- [IpRule::IpPermissionInbound::GCPIpRule](#ipruleippermissioninboundgcpiprule)
  - [Relationships](#relationships-10)
- [IpRange](#iprange)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## GCPOrganization

Representation of a GCP [Organization](https://cloud.google.com/resource-manager/reference/rest/v1/organizations) object.


| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | The name of the GCP Organization, e.g. "organizations/1234" |
| displayname | The "friendly name", e.g. "My Company"
| lifecyclestate | The organization's current lifecycle state. Assigned by the server.  See the [official docs](https://cloud.google.com/resource-manager/reference/rest/v1/organizations#LifecycleState).

### Relationships

- GCPOrganizations contain GCPFolders.

    ```
    (GCPOrganization)-[RESOURCE]->(GCPFolder)
    ```

- GCPOrganizations can contain GCPProjects.

    ```
    (GCPOrganization)-[RESOURCE]->(GCPProjects)
    ```

 ## GCPFolder

 Representation of a GCP [Folder](https://cloud.google.com/resource-manager/reference/rest/v2/folders).  An additional helpful reference is the [Google Compute Platform resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy).

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | The name of the folder, e.g. "folders/1234"|
| displayname | A friendly name of the folder, e.g. "My Folder".
| lifecyclestate | The folder's current lifecycle state. Assigned by the server.  See the [official docs](https://cloud.google.com/resource-manager/reference/rest/v2/folders#LifecycleState).


 ### Relationships

 - GCPOrganizations are parents of GCPFolders.

    ```
    (GCPOrganization)<-[PARENT]-(GCPFolder)
    ```

 - GCPFolders can contain GCPProjects

    ```
    (GCPFolder)-[RESOURCE]->(GCPProject)
    ```

 - GCPFolders can contain other GCPFolders.

    ```
    (GCPFolder)-[RESOURCE]->(GCPFolder)
    ```

 ## GCPProject

 Representation of a GCP [Project](https://cloud.google.com/resource-manager/reference/rest/v1/projects).  An additional helpful reference is the [Google Compute Platform resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy).

 | Field | Description |
 |-------|--------------|
 | firstseen| Timestamp of when a sync job first discovered this node  |
 | lastupdated |  Timestamp of the last time the node was updated |
 | id | The ID of the project, e.g. "sys-12345"|
 | projectnumber | The number uniquely identifying the project, e.g. '987654'|
 | displayname | A friendly name of the project, e.g. "MyProject".
 | lifecyclestate | The project's current lifecycle state. Assigned by the server.  See the [official docs](https://cloud.google.com/resource-manager/reference/rest/v1/projects#LifecycleState).

 ### Relationships

- GCPOrganizations contain GCPProjects.

    ```
    (GCPOrganization)-[RESOURCE]->(GCPProjects)
    ```

 - GCPFolders can contain GCPProjects

    ```
    (GCPFolder)-[RESOURCE]->(GCPProject)
    ```

- GCPVpcs are part of GCPProjects

    ```
    (GCPProject)-[RESOURCE]->(GCPVpc)
    ```


 ## GCPBucket
 Representation of a GCP [Storage Bucket](https://cloud.google.com/storage/docs/json_api/v1/buckets).

 | Field | Description |
 |-------|--------------|
 | firstseen| Timestamp of when a sync job first discovered this node  |
 | lastupdated |  Timestamp of the last time the node was updated |
 | id | The ID of the storage bucket, e.g. "bucket-12345"|
 | projectnumber | The number uniquely identifying the project associated with the storage bucket, e.g. '987654' |
 | self_link | The URI of the storage bucket |
 | kind | The kind of item this is. For storage buckets, this is always storage#bucket |
 | location | The location of the bucket. Object data for objects in the bucket resides in physical storage within this region. Defaults to US. See [Cloud Storage bucket locations](https://cloud.google.com/storage/docs/locations) for the authoritative list. |
 | location_type | The type of location that the bucket resides in, as determined by the `location` property |
 | labels | User-provided bucket [labels](https://cloud.google.com/storage/docs/key-terms#bucket-labels), in key/value pairs |
 | meta_generation | The metadata generation of this bucket |
 | storage_class | The bucket's default storage class, used whenever no `storageClass` is specified for a newly-created object. For more information, see [storage classes](https://cloud.google.com/storage/docs/storage-classes) |
 | time_created | The creation time of the bucket in RFC 3339 format |
 | retention_period | The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or archived |
 | iam_config_bucket_policy_only | The bucket's [Bucket Policy Only](https://cloud.google.com/storage/docs/bucket-policy-only) configuration |
 | owner_entity | The entity, in the form `project-owner-projectId` |
 | owner_entity_id | The ID for the entity |
 | versioning_enabled | The bucket's versioning configuration (if set to `True`, versioning is fully enabled for this bucket) |
 | log_bucket | The destination bucket where the current bucket's logs should be placed |
 | requester_pays | The bucket's billing configuration (if set to true, Requester Pays is enabled for this bucket) |
 | default_kms_key_name | A Cloud KMS key that will be used to encrypt objects inserted into this bucket, if no encryption method is specified |

 ### Relationships


- GCPBuckets are part of GCPProjects.

    ```
    (GCPProject)-[RESOURCE]->(GCPBucket)
    ```


 ## GCPInstance

 Representation of a GCP [Instance](https://cloud.google.com/compute/docs/reference/rest/v1/instances).  Additional references can be found in the [official documentation]( https://cloud.google.com/compute/docs/concepts).

 | Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | The partial resource URI representing this instance. Has the form `projects/{project_name}/zones/{zone_name}/instances/{instance_name}`. |
| partial_uri | Same as `id` above. |
| self_link | The full resource URI representing this instance. Has the form `https://www.googleapis.com/compute/v1/{partial_uri}` |
| instancename | The name of the instance, e.g. "my-instance" |
| zone_name | The zone that the instance is installed on |
| hostname | If present, the hostname of the instance |
| internet_exposed | Set to True  with `exposed_internet_type = 'direct'` if there is an 'allow' IPRule attached to one of the instance's ingress firewalls with the following conditions:  The 'allow' IpRule allows traffic from one or more TCP ports, and the 'allow' IpRule is not superceded by a 'deny' IPRule (in GCP, a firewall rule of priority 1 gets applied ahead of a firewall rule of priority 100, and 'deny' rules of the same priority are applied ahead of 'allow' rules) |
| status | The [GCP Instance Lifecycle](https://cloud.google.com/compute/docs/instances/instance-life-cycle) state of the instance |

### Relationships

- GCPInstances are resources of GCPProjects.

    ```
    (GCPProject)-[RESOURCE]->(GCPInstance)
    ```

- GCPNetworkInterfaces are attached to GCPInstances

    ```
    (GCPInstance)-[NETWORK_INTERFACE]->(GCPNetworkInterface)
    ```

- GCP Instances may be members of one or more GCP VPCs.

    ```
    (GCPInstance)-[:MEMBER_OF_GCP_VPC]->(GCPVpc)
    ```

    Also note that this relationship is a shortcut for:

    ```
    (GCPInstance)-[:NETWORK_INTERFACE]->(:GCPNetworkInterface)-[:PART_OF_SUBNET]->(GCPSubnet)<-[:RESOURCE]-(GCPVpc)
    ```

- GCP Instances may have GCP Tags defined on them for use in [network firewall routing](https://cloud.google.com/blog/products/gcp/labelling-and-grouping-your-google-cloud-platform-resources).

    ```
    (GCPInstance)-[:TAGGED]->(GCPNetworkTag)
    ```

- GCP Firewalls allow ingress to GCP instances.
    ```
    (GCPFirewall)-[:FIREWALL_INGRESS]->(GCPInstance)
    ```

    Note that this relationship is a shortcut for:
    ```
    (vpc:GCPVpc)<-[MEMBER_OF_GCP_VPC]-(GCPInstance)-[TAGGED]->(GCPNetworkTag)-[TARGET_TAG]-(GCPFirewall{direction: 'INGRESS'})<-[RESOURCE]-(vpc)
    ```

    as well as
    ```
    MATCH (fw:GCPFirewall{direction: 'INGRESS', has_target_service_accounts: False}})
    WHERE NOT (fw)-[TARGET_TAG]->(GCPNetworkTag)
    MATCH (GCPInstance)-[MEMBER_OF_GCP_VPC]->(GCPVpc)-[RESOURCE]->(fw)
    ```

## GCPNetworkTag

Representation of a Tag defined on a GCP Instance or GCP Firewall.  Tags are defined on GCP instances for use in [network firewall routing](https://cloud.google.com/blog/products/gcp/labelling-and-grouping-your-google-cloud-platform-resources).

| Field | Description |
|-------|-------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | GCP doesn't define a resource URI for Tags so we define this as `{instance resource URI}/tags/{tag value}`
| tag_id | same as `id` |
| value | The actual value of the tag |

### Relationships

- GCP Instances can be labeled with tags.
    ```
    (GCPInstance)-[:TAGGED]->(GCPNetworkTag)
    ```

- GCP Firewalls can be labeled with tags to direct traffic to or deny traffic to labeled GCPInstances
    ```
    (GCPFirewall)-[:TARGET_TAG]->(GCPNetworkTag)
    ```

- GCPNetworkTags are defined on a VPC and only have effect on assets in that VPC

    ```
    (GCPVpc)-[DEFINED_IN]->(GCPNetworkTag)
    ```

## GCPVpc

Representation of a GCP [VPC](https://cloud.google.com/compute/docs/reference/rest/v1/networks/).  In GCP documentation this is also known simply as a "Network" object.

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | The partial resource URI representing this VPC.  Has the form `projects/{project_name}/global/networks/{vpc name}`.
| partial_uri | Same as `id` |
| self_link | The full resource URI representing this VPC. Has the form `https://www.googleapis.com/compute/v1/{partial_uri}` |
| name | The name of the VPC |
| project_id | The project ID that this VPC belongs to |
| auto_create_subnetworks | When set to true, the VPC network is created in "auto" mode. When set to false, the VPC network is created in "custom" mode.  An auto mode VPC network starts with one subnet per region. Each subnet has a predetermined range as described in [Auto mode VPC network IP ranges](https://cloud.google.com/vpc/docs/vpc#ip-ranges). |
| routing_confg_routing_mode | The network-wide routing mode to use. If set to REGIONAL, this network's Cloud Routers will only advertise routes with subnets of this network in the same region as the router. If set to GLOBAL, this network's Cloud Routers will advertise routes with all subnets of this network, across regions. |
| description | A description for the VPC |

### Relationships

- GCPVpcs are part of projects

    ```
    (GCPProject)-[RESOURCE]->(GCPVpc)
    ```

- GCPVpcs contain GCPSubnets

    ```
    (GCPVpc)-[RESOURCE]->(GCPSubnet)
    ```

- GCPSubnets are part of GCP VPCs

    ```
    (GCPVpc)-[RESOURCE]->(GCPSubnet)
    ```

- GCPNetworkTags are defined on a VPC and only have effect on assets in that VPC

    ```
    (GCPVpc)-[DEFINED_IN]->(GCPNetworkTag)
    ```

- GCP Instances may be members of one or more GCP VPCs.

    ```
    (GCPInstance)-[:MEMBER_OF_GCP_VPC]->(GCPVpc)
    ```

    Also note that this relationship is a shortcut for:

    ```
    (GCPInstance)-[:NETWORK_INTERFACE]->(:GCPNetworkInterface)-[:PART_OF_SUBNET]->(GCPSubnet)<-[:RESOURCE]-(GCPVpc)
    ```

## GCPNetworkInterface

Representation of a GCP Instance's [network interface](https://cloud.google.com/compute/docs/reference/rest/v1/instances/list) (scroll down to the fields on "networkInterface").

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | A partial resource URI representing this network interface.  Note: GCP does not define a partial resource URI for network interfaces, so we create one so we can uniquely identify GCP network interfaces.  Has the form `projects/{project_name}/zones/{zone_name}/instances/{instance_name}/networkinterfaces/{network interface name}`.
| nic_id | Same as `id` |
| name | The name of the network interface |
| private_ip | The private IP address of this network interface.  This IP is valid on the network interface's VPC. |

### Relationships

- GCPNetworkInterfaces are attached to GCPInstances

    ```
    (GCPInstance)-[NETWORK_INTERFACE]->(GCPNetworkInterface)
    ```

- GCPNetworkInterfaces are connected to GCPSubnets

    ```
    (GCPNetworkInterface)-[PART_OF_SUBNET]->(GCPSubnet)
    ```

- GCPNetworkInterfaces have GCPNicAccessConfig objects defined on them

    ```
    (GCPNetworkInterface)-[RESOURCE]->(GCPNicAccessConfig)
    ```


## GCPNicAccessConfig

Representation of the AccessConfig object on a GCP Instance's [network interface](https://cloud.google.com/compute/docs/reference/rest/v1/instances/list) (scroll down to the fields on "networkInterface").

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | A partial resource URI representing this AccessConfig.  Note: GCP does not define a partial resource URI for AccessConfigs, so we create one so we can uniquely identify GCP network interface access configs.  Has the form `projects/{project_name}/zones/{zone_name}/instances/{instance_name}/networkinterfaces/{network interface name}/accessconfigs/{access config type}`.
| partial_uri | Same as `id` |
| type | The type of configuration. GCP docs say: "The default and only option is ONE_TO_ONE_NAT." |
| name | The name of this access configuration. The default and recommended name is External NAT, but you can use any arbitrary string, such as My external IP or Network Access. |
| public_ip | The external IP associated with this instance |
| set_public_ptr | Specifies whether a public DNS 'PTR' record should be created to map the external IP address of the instance to a DNS domain name. |
| public_ptr_domain_name | The DNS domain name for the public PTR record. You can set this field only if the setPublicPtr field is enabled. |
| network_tier | This signifies the networking tier used for configuring this access configuration and can only take the following values: PREMIUM, STANDARD. |

### Relationships

- GCPNetworkInterfaces have GCPNicAccessConfig objects defined on them

    ```
    (GCPNetworkInterface)-[RESOURCE]->(GCPNicAccessConfig)
    ```

## GCPSubnet

Representation of a GCP [Subnetwork](https://cloud.google.com/compute/docs/reference/rest/v1/subnetworks).

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | A partial resource URI representing this Subnet.  Has the form `projects/{project}/regions/{region}/subnetworks/{subnet name}`.
| partial_uri | Same as `id` |
| self_link | The full resource URI representing this subnet. Has the form `https://www.googleapis.com/compute/v1/{partial_uri}` |
| project_id | The project ID that this Subnet belongs to |
| name | The name of this Subnet |
| region | The region of this Subnet |
| gateway_address | Gateway IP address of this Subnet |
| ip_cidr_range | The CIDR range covered by this Subnet |
| vpc_partial_uri | The partial URI of the VPC that this Subnet is a part of |
| private_ip_google_access | Whether the VMs in this subnet can access Google services without assigned external IP addresses. This field can be both set at resource creation time and updated using setPrivateIpGoogleAccess. |

### Relationships

- GCPSubnets are part of GCP VPCs

    ```
    (GCPVpc)-[RESOURCE]->(GCPSubnet)
    ```

- GCPNetworkInterfaces are connected to GCPSubnets

    ```
    (GCPNetworkInterface)-[PART_OF_SUBNET]->(GCPSubnet)
    ```


## GCPFirewall

Representation of a GCP [Firewall](https://cloud.google.com/compute/docs/reference/rest/v1/firewalls/list).

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | A partial resource URI representing this Firewall.
| partial_uri | Same as `id` |
| direction | Either 'INGRESS' for inbound or 'EGRESS' for outbound
| disabled | Whether this firewall object is disabled
| priority | The priority of this firewall rule from 1 (apply this first)-65535 (apply this last)
| self_link | The full resource URI to this firewall |
| has_target_service_accounts | Set to True if this Firewall has target service accounts defined. This field is currently a placeholder for future functionality to add GCP IAM objects to Cartography. If True, this firewall rule will only apply to GCP instances that use the specified target service account. |

### Relationships

- Firewalls belong to VPCs

    ```
    (GCPVpc)-[RESOURCE]->(GCPFirewall)
    ```

- Firewalls define rules that allow traffic

    ```
    (GcpIpRule)-[ALLOWED_BY]->(GCPFirewall)
    ```

- Firewalls define rules that deny traffic

    ```
    (GcpIpRule)-[DENIED_BY]->(GCPFirewall)
    ```

- GCP Firewalls can be labeled with tags to direct traffic to or deny traffic to labeled GCPInstances
    ```
    (GCPFirewall)-[:TARGET_TAG]->(GCPNetworkTag)
    ```

- GCP Firewalls allow ingress to GCP instances.
    ```
    (GCPFirewall)-[:FIREWALL_INGRESS]->(GCPInstance)
    ```

    Note that this relationship is a shortcut for:
    ```
    (vpc:GCPVpc)<-[MEMBER_OF_GCP_VPC]-(GCPInstance)-[TAGGED]->(GCPNetworkTag)-[TARGET_TAG]-(GCPFirewall{direction: 'INGRESS'})<-[RESOURCE]-(vpc)
    ```

    as well as
    ```
    MATCH (fw:GCPFirewall{direction: 'INGRESS', has_target_service_accounts: False}})
    WHERE NOT (fw)-[TARGET_TAG]->(GCPNetworkTag)
    MATCH (GCPInstance)-[MEMBER_OF_GCP_VPC]->(GCPVpc)-[RESOURCE]->(fw)
    ```


## IpRule::IpPermissionInbound::GCPIpRule

An IpPermissionInbound node is a specific type of IpRule.  It represents a generic inbound IP-based rules.  The creation of this node is currently derived from ingesting AWS [EC2 Security Group](#ec2securitygroup) rules.

| Field | Description |
|-------|-------------|
| **ruleid** | `{firewall_partial_uri}/{rule_type}/{port_range}{protocol}` |
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| protocol | The protocol this rule applies to |
| fromport | Lowest port in the range defined by this rule|
| toport | Highest port in the range defined by this rule|

### Relationships

- GCP Firewall rules are defined on IpRange objects.

	```
	(GCPIpRule, IpRule, IpPermissionInbound)<-[MEMBER_OF_IP_RULE)-(:IpRange)
	```

- Firewalls define rules that allow traffic

    ```
    (GcpIpRule)-[ALLOWED_BY]->(GCPFirewall)
    ```

- Firewalls define rules that deny traffic

    ```
    (GcpIpRule)-[DENIED_BY]->(GCPFirewall)
    ```

## IpRange

Representation of an IP range or subnet.

| Field | Description |
|-------|--------------|
| firstseen| Timestamp of when a sync job first discovered this node  |
| lastupdated |  Timestamp of the last time the node was updated |
| id | CIDR notation for the IP range. E.g. "0.0.0.0/0" for the whole internet.

- GCP Firewall rules are defined on IpRange objects.

	```
	(GCPIpRule, IpRule, IpPermissionInbound)<-[MEMBER_OF_IP_RULE)-(:IpRange)
	```
