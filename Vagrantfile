Vagrant.configure("2") do |config|
    config.vm.box = "redhat-6.5-devops"
    #config.proxy.http = "http://webproxy.wlb2.nam.nsroot.net:8080"
    #config.proxy.https = "http://webproxy.wlb2.nam.nsroot.net:8080"
    config.proxy.http = ""
    config.proxy.https = ""

    config.vm.network :forwarded_port, guest: 2000, host: 1234
    config.vm.hostname = "jdk.vagrant.internal"
    config.berkshelf.enabled = "true"
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "C:\\Users\\as15085\\Desktop\\Chef\\CookBooks\\"
      chef.add_recipe "JDK::default"
      #chef.install = false
      #   chef.add_recipe "ihs::install_ihs"
      #   chef.add_recipe "ihs::create_ihs_instance"
      #   chef.add_recipe "ihs::config_ihs"
      #   chef.add_recipe "siteminder::install_web_agent"
      #   chef.add_recipe "siteminder::register_web_agent"
      #   chef.add_recipe "siteminder::configure_ihs_files"
    end
end
