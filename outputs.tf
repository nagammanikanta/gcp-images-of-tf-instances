output "instance" {
 value = google_compute_instance.instance_terra
 sensitive = true
  
}

output "custom" {
    value = google_compute_network.custom-vpc-tf
   sensitive = true
}

output "subnet" {
    value = google_compute_subnetwork.subnet-tf
   sensitive = true
}
output "ip" {
    value = google_compute_subnetwork.subnet-tf.ip_cidr_range
   sensitive = true
}
output "firewall" {
    value = google_compute_firewall.firewall-terra
   sensitive = true
}
output "static-bucket" {
    value = google_storage_bucket.static-bucket
    sensitive = true
}
output "primary-cluster" {
    value = google_container_cluster.primary-cluster
   sensitive = true
}
output "sa_tf" {
  value = google_service_account.sa_tf
  sensitive = true
}
 output "primary_preemptible_nodes" {
    value = google_container_node_pool.primary_preemptible_nodes.node_count
    sensitive = true
 }
 output "vpc-1" {
    value = google_compute_network.vpc-1
    sensitive = true
 }
 output "vpc-2" {
   value = google_compute_network.vpc-2
    sensitive = true
 }
 output "vpc-3" {
    value = google_compute_network.vpc-3
     sensitive = true
   
 }
 output "peering1" {
    value = google_compute_network_peering.peering1
    sensitive = true
 }
 output "peering2" {
    value = google_compute_network_peering.peering2
    sensitive = true
 }
 output "peering3" {
 value =  google_compute_network_peering.peering3
  sensitive = true
 }
 output "peering4" {
  value =  google_compute_network_peering.peering4
   sensitive = true
   
 }
 output "database-tf" {
   value = google_sql_database.database-tf
    sensitive = true
 }
 output "instance-sql-tf" {
    value = google_sql_database_instance.instance-sql-tf
     sensitive = true
   
 }
 output "users" {
  value = google_sql_user.users.name
   sensitive = true

   
 }
 output "forwarding-tf" {
   value = google_compute_forwarding_rule.forwarding-tf
 } 
 
 output "backend-tf" {
   value = google_compute_region_backend_service.backend-tf
   
 }
 output "nat-tf" {
   value = google_compute_router_nat.nat-tf
   
 }

 output "router-tf" {
   value = google_compute_router.router-tf

   
 }


   
