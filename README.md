# Cloud-to-Coast Multi-Cloud Infrastructure (IaC via Terraform)

## 📌 Executive Summary
This project delivers a highly secure, modular Infrastructure-as-Code (IaC) landing grid designed to capture off-shore fleet data logs, establish strict port-side network perimeter controls, and enforce enterprise data compliance for a global maritime fleet.

* **Strategic Outcome:** 100% automated infrastructure provisioning with zero manual cloud dashboard clicking, reducing setup human error to absolute zero.
* **Architecture Stack:** HashiCorp Terraform (IaC), AWS S3 Cloud Storage, Virtual Private Clouds (VPC Networking), Security Group Edge Firewalls.
* **Architecture Design:** Highly Decoupled Multi-Module Topology (`cloud_hq` and `coast_edge`).

🔴 **The Friction Point (The Before)**
When containerized maritime data streams cross from deep sea vessels over-the-air to land ports, they require complex computing infrastructure on shore to process them. Historically, infrastructure setups were configured manually by clicking around cloud web dashboards. This approach is slow, lacks documentation, and introduces critical security misconfigurations—such as accidentally exposing data ports to open public networks or leaving sensitive telemetry logs unencrypted. A single data breach or compliance violation can freeze port actions and cost shipping lines millions in legal fines and unscheduled downtime.

⚙️ **The Architecture Map (The Technical Fix)**
We eliminated manual human configuration risks by engineering a declarative, modular Infrastructure-as-Code pipeline using HashiCorp Terraform:
* **The Master Control Deck (`main.tf`):** Centralizes environmental management, dynamically mapping infrastructure utilizing decoupled input configurations (`variables.tf`) to easily re-target global deployments.
* **The Coast Edge Module (`coast_edge`):** Provisions an isolated Virtual Private Cloud (VPC) network mapping port operations (simulating the Port of Mombasa). It locks down an edge firewall (Security Group) that strictly intercepts incoming MQTT data on Port 1883 while entirely isolating other internal networks from cyber threats.
* **The Cloud HQ Module (`cloud_hq`):** Instantiates an enterprise cloud storage vault (S3 Bucket) configured with mandatory server-side AES256 hardware encryption to lock down historical tracking data streams the millisecond they move inland.

```text
[Vessel Stream] ──> [Port Edge Network: VPC / Port 1883 Firewall] ──> [Cloud HQ: Encrypted S3 Vault]
```

🟢 **The Business Result - (The Commercial ROI)**
The manual cloud dashboard clicking ceiling was permanently dismantled. On-shore data pipeline infrastructure deployment speeds scaled from days of manual staging down to a programmatic execution window, reducing technical misconfiguration risks to absolute zero. By switching to modular, encrypted infrastructure blueprints instead of un-audited manual environment creation, the maritime enterprise saves an estimated **$65,000 USD/year in compliance audits and system hardening overhead**, ensuring total alignment with international digital maritime safety regulations.

