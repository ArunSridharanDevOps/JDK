default['ihs']['user_id'] = 'rusa'
default['ihs']['group'] = 'sgsup'
default['ihs']['root'] = '/apps/ihs-bin'
default['ihs']['conf_root'] = '/apps/ihs-apps'
#default['ihs']['sec_root'] = '/opt/ihsSec'
default[:jdk][:rpm_file] = "/apps/jdk.rpm"
default[:jdk][:s3_url] = "https://s3-us-west-2.amazonaws.com/aruns3/jre-8u73-linux-i586.rpm"
