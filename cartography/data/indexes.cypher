CREATE INDEX ON :AccountAccessKey(accesskeyid);
CREATE INDEX ON :AutoScalingGroup(arn);
CREATE INDEX ON :AWSAccount(id);
CREATE INDEX ON :AWSDNSRecord(id);
CREATE INDEX ON :AWSDNSZone(name);
CREATE INDEX ON :AWSGroup(arn);
CREATE INDEX ON :AWSPolicy(arn);
CREATE INDEX ON :AWSRole(arn);
CREATE INDEX ON :AWSUser(arn);
CREATE INDEX ON :AWSUser(name);
CREATE INDEX ON :DBGroup(name);
CREATE INDEX ON :DNSRecord(id);
CREATE INDEX ON :DNSZone(name);
CREATE INDEX ON :DynamoDBTable(arn);
CREATE INDEX ON :DynamoDBTable(id);
CREATE INDEX ON :EC2Instance(instanceid);
CREATE INDEX ON :EC2Instance(publicdnsname);
CREATE INDEX ON :EC2Reservation(reservationid);
CREATE INDEX ON :EC2SecurityGroup(id);
CREATE INDEX ON :EC2SecurityGroup(groupid);
CREATE INDEX ON :EC2Subnet(id);
CREATE INDEX ON :EC2Subnet(subnetid);
CREATE INDEX ON :ELBListener(id);
CREATE INDEX ON :Endpoint(id);
CREATE INDEX ON :ESDomain(arn);
CREATE INDEX ON :ESDomain(id);
CREATE INDEX ON :ESDomain(name);
CREATE INDEX ON :Ip(ip);
CREATE INDEX ON :Ip(id);
CREATE INDEX ON :IpPermissionInbound(ruleid);
CREATE INDEX ON :IpPermissionsEgress(ruleid);
CREATE INDEX ON :IpRange(id);
CREATE INDEX ON :IpRule(ruleid);
CREATE INDEX ON :LoadBalancer(dnsname);
CREATE INDEX ON :LoadBalancer(id);
CREATE INDEX ON :NetworkInterface(id);
CREATE INDEX ON :Principal(arn);
CREATE INDEX ON :PublicIpAddress(ip);
CREATE INDEX ON :RDSInstance(id);
CREATE INDEX ON :RDSInstance(db_instance_identifier);
CREATE INDEX ON :S3Bucket(name);
CREATE INDEX ON :User(arn);
CREATE INDEX ON :S3Acl(id);