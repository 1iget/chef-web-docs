current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "delivery"
client_key                "#{current_dir}/delivery.pem"
chef_server_url           "https://ec2-54-90-95-197.compute-1.amazonaws.com/organizations/automate"
cookbook_path             ["#{current_dir}/../cookbooks"]