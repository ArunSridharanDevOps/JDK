# IBM HTTP Server 7.0.0.37 Cookbook

It provides resources for installing IBM HTTP Server, creating a new customized IHS instance, Configuring SSL and httpd.
Installs IHS from CATE rpms and configure httpd.conf per CTO EPS team standard.

Procedure to use this cookbook for Installation and Configuration in AWS using OpsWorks
------------------------------------------------------------------------------------------------
1. AWS Account
2. Privelages to access Opsworks.
3. Add the following recipes in OpsWorks.

    default.rb
    
    install_ihs.rb
    
    create_ihs_instance.rb
    
    config_ihs.rb
    
4.  Provide JSON details for attibutes.

Procedure to use this cookbook for configuration in Citi On-Prem
------------------------------------------------------------------------------------------------

Requirements
------------------------
- Install Chef client package. (https://catecollaboration.citigroup.net/domains/platstor/itedca/ChefDocuments/RFP-ChefAgent_Linux_v12.4.1-1.pdf)
- Download, extract and upload this cookbook in the node where it needs to be executed.
- Download the IHS rpms from GDS and place it in /tmp/ (https://catecollaboration.citigroup.net/domains/deveng/WebHostingEng/IBMHTTPServer/default.aspx)
    - IHS.IHS70037-A0-1.0.0.0.x86_64.rpm
    - IHS.ihsPlg-A0-1.0.0.5.x86_64.rpm

## Platforms
------------------------
Red Hat Enterprise Linux 6.x

Usage
-----
#### ihs_rpm_install::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `ihs_rpm_install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ihs_rpm_install]"
  ]
}
```

## Attributes
----------

#### ihs::default

It creates a required IHS binary root and Conf root directories.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ihs']['user_id']</tt></td>
    <td>String</td>
    <td>Functional ID name owning this instance</td>
    <td><tt>rusa</tt></td>
  </tr>
  <tr>
    <td><tt>['ihs']['group']</tt></td>
    <td>String</td>
    <td>Group name owning this instance</td>
    <td><tt>sgsup</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['root']</tt></td>
    <td>String</td>
    <td>Path for IHS binary</td>
    <td><tt>/apps/ihs-bin/</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['conf_root']</tt></td>
    <td>String</td>
    <td>Path for IHS instance root</td>
    <td><tt>/apps/ihs-apps/</tt></td>
  </tr>
</table>

#### ihs::install_ihs

It installs IHS binary and IHS plugin RPMs.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ihs']['binary_rpm']</tt></td>
    <td>String</td>
    <td>Binary RPM location</td>
    <td><tt>/tmp/IHS.IHS70037-A0-1.0.0.0.x86_64.rpm</tt></td>
  </tr>
  <tr>
    <td><tt>['ihs']['plugin_rpm']</tt></td>
    <td>String</td>
    <td>Plugin RPM location</td>
    <td><tt>/tmp/IHS.ihsPlg-A0-1.0.0.5.x86_64.rpm</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['input_file_path']</tt></td>
    <td>String</td>
    <td>Input file path</td>
    <td><tt>/tmp/installIHS7.dat</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['input_file_name']</tt></td>
    <td>String</td>
    <td>Input file name</td>
    <td><tt>/installIHS7.dat</tt></td>
  </tr>
</table>

#### ihs::create_ihs_instance

It creates a new IHS instances using CATE ihs Sec Scripts.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ihs']['instance_name']</tt></td>
    <td>String</td>
    <td>IHS Instance name</td>
    <td><tt>https-cheftest</tt></td>
  </tr>
  <tr>
    <td><tt>['ihs']['instance_port']</tt></td>
    <td>String</td>
    <td>instance Port</td>
    <td><tt>2000</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['instance_conf']</tt></td>
    <td>String</td>
    <td>Instance Conf path</td>
    <td><tt>/apps/ihs-apps/https-cheftest</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['ins_script_path']</tt></td>
    <td>String</td>
    <td>instance Creation script path</td>
    <td><tt>/apps/ihs-bin/IHS70037/ihs-newinst.sh</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['ins_script_name']</tt></td>
    <td>String</td>
    <td>Script name</td>
    <td><tt>ihs-newinst.sh</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['env_script_path']</tt></td>
    <td>String</td>
    <td>Env script path</td>
    <td><tt>/apps/ihs-bin/IHS70037/setIHSEnv.sh</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['env_script_name']</tt></td>
    <td>String</td>
    <td>Env script name</td>
    <td><tt>setIHSEnv.sh</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['template_dir']</tt></td>
    <td>String</td>
    <td>Template Directory for conf files</td>
    <td><tt>/apps/ihs-bin/IHS70037/XXTEMPLATEXX</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['template_source']</tt></td>
    <td>String</td>
    <td>Template directory source files</td>
    <td><tt>XXTEMPLATEXX</tt></td>
  </tr>
</table>

#### ihs::configure_ihs

It configures SSL, httpd.conf and key files.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ihs']['dir']</tt></td>
    <td>String</td>
    <td>IHS binary location</td>
    <td><tt>/apps/ihs-bin/IHS70037</tt></td>
  </tr>
  <tr>
    <td><tt>['ihs']['conf_dir']</tt></td>
    <td>String</td>
    <td>Instance configuration location</td>
    <td><tt>/apps/ihs-apps/https-cheftest/conf</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['docroot_dir']</tt></td>
    <td>String</td>
    <td>Siteminder Doc root</td>
    <td><tt>/apps/siteminder/webagent/https-cheftest</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['log_dir']</tt></td>
    <td>String</td>
    <td>Log directory</td>
    <td><tt>/logs/ihs/https-cheftest/</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['log_root']</tt></td>
    <td>String</td>
    <td>log location root</td>
    <td><tt>/logs/ihs/https-cheftest/logs</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['hostname']</tt></td>
    <td>String</td>
    <td>Machine hostname</td>
    <td><tt>localhost</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['siteminder_root']</tt></td>
    <td>String</td>
    <td>Siteminder install Root</td>
    <td><tt>/apps/siteminder</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['plugin_dir']</tt></td>
    <td>String</td>
    <td>Plugin direcotry location</td>
    <td><tt>/apps/ihs-bin/IHS70037/Plugins/</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['key_file']</tt></td>
    <td>String</td>
    <td>SSL - Key File</td>
    <td><tt>/apps/ihs-apps/https-cheftest/conf/https-cheftest.kdb</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['stash_file']</tt></td>
    <td>String</td>
    <td>SSL - Stash File</td>
    <td><tt>/apps/ihs-apps/https-cheftest/conf/https-cheftest.sth</tt></td>
  </tr>
    <tr>
    <td><tt>['ihs']['cert_CN']</tt></td>
    <td>String</td>
    <td>Certificate Common Name</td>
    <td><tt>https-cheftest</tt></td>
  </tr>
</table>