require 'rubygems'
require 'aws-sdk'
require 'AWS'


inst = ec2.instances.create(
  # :image_id => ec2.images.with_owner("508971454034").tagged('default').first.id, # our custom AMI
  :image_id => 'ami-d33f62ba', # latest AMI as of this writing
  :instance_type => 'm1.small',
  :key_name => 'GE_Sandbox_East',
  #:iam_instance_profile => 'iam-role', # delete this line if no role assigned to this instance
  #:user_data => userdata # delete this line of no userdata
)
 
puts "Waiting for new instance with id #{inst.id} to become available..."
sleep 1 while inst.status == :pending

#tagname = ec2.instances["#{inst.id}"].tags << "Ravi_test1"
puts "#{inst.dns_name} is ready"
puts "Ip address of the instance #{inst.public_ip_address}"
puts "Instance ID : #{inst.id}"
#puts "Name : #{tagname}"
