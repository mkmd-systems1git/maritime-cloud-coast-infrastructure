# Provision an isolated virtual cloud network for the coast receiving station
resource "aws_vpc" "coast_network" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "mombasa-port-receiving-network"
    Environment = "Production"
    ManagedBy   = "Terraform-IaC"
  }
}

# Engineer an edge network firewall (Security Group) to control incoming data traffic
resource "aws_security_group" "port_firewall" {
  name        = "vessel-telemetry-firewall"
  description = "Enforce isolation rules for incoming vessel telemetry streams"
  vpc_id      = aws_vpc.coast_network.id

  # Inbound Rule: Allow incoming MQTT stream data strictly on Port 1883
  ingress {
    description = "Allow secure MQTT telemetry loop inputs from active vessels"
    from_port   = 1883
    to_port     = 1883
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # In production, this would be restricted to the fleet's IP ranges
  }

  # Outbound Rule: Allow secure data synchronization out to our cloud databases
  egress {
    description = "Allow processed logs to route securely out to the shore cloud vault"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
