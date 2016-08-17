#----------------------------------------------------------------------------
#  Copyright (c) 2016 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#----------------------------------------------------------------------------

class wso2am::params inherits wso2base::params {

  # apim specific parameters - start
  $am_datasources     = {
    wso2am_db => {
      name => 'WSO2AM_DB',
      description => 'The datasource used for registry and user manager',
      driver_class_name => 'org.h2.Driver',
      url => 'jdbc:h2:repository/database/WSO2AM_DB;DB_CLOSE_ON_EXIT=FALSE;LOCK_TIMEOUT=60000',
      username => 'wso2carbon',
      password => 'wso2carbon',
      jndi_config => 'jdbc/WSO2AM_DB',
      max_active => '50',
      max_wait => '60000',
      test_on_borrow => true,
      default_auto_commit => false,
      validation_query => 'SELECT 1',
      validation_interval => '30000'
    }
  }
  $apim_gateway       = {
    host => 'am.dev.wso2.org',
    port => 9443,
    api_endpoint_host => 'am.dev.wso2.org',
    api_endpoint_port => 8280,
    secure_api_endpoint_port => 8243,
    api_token_revoke_endpoint_port => 8280,
    secure_api_token_revoke_endpoint_port => 8243,
    username => 'wso2carbon',
    password => 'wso2carbon'
  }
  $apim_keymanager    = {
    host => 'am.dev.wso2.org',
    port => 9443,
    username => 'wso2carbon',
    password => 'wso2carbon'
 }
  $apim_publisher     = {
    host => 'am.dev.wso2.org',
    port => 9443
  }
  $apim_store         = {
    host => 'am.dev.wso2.org',
    port => 9443
  }
  $apim_traffic_manager    = {
    host => 'am.dev.wso2.org',
    port => 9443,
    receiver_url_port => 9611,
    auth_url_port => 9711,
    jms_url_port => 5672,
    username => 'wso2carbon',
    password => 'wso2carbon'
  }
  $template_list          = [
    'repository/conf/carbon.xml',
    'repository/conf/user-mgt.xml',
    'repository/conf/registry.xml',
    'repository/conf/datasources/am-datasources.xml',
    'repository/conf/datasources/master-datasources.xml',
    'repository/conf/tomcat/catalina-server.xml',
    'repository/conf/axis2/axis2.xml',
    'repository/conf/security/authenticators.xml',
    'bin/wso2server.sh'
  ]
  $is_datasource                                            = 'wso2am_db'
  $am_datasource                                            = 'wso2am_db'
  $enable_advance_throttling                                = false
  $key_validator_client_type                                = 'ThriftClient'
  $enable_thrift_server                                     = true
  $thrift_server_host                                       = 'localhost'
  $key_store                                                = undef
  $trust_store                                              = undef
  $enable_data_publisher                                    = false
  $enable_block_condition                                   = true
  $enable_jms_connection_details                            = false
  $apim_gateway_disable_jms_event_parameters                = false
  $enable_traffic_manager_specific_axis2_configurations     = false
  $enable_traffic_manager_specific_registry_configurations  = false
  # apim specific parameters - end

  # # common parameters - start
  # $java_class             = 'wso2base::java'
  # $java_prefs_system_root = '/home/wso2user/.java'
  # $java_prefs_user_root   = '/home/wso2user/.java/.systemPrefs'
  # $java_home              = '/opt/java'
  # # system configuration data
  # $packages               = [
  #   'zip',
  #   'unzip'
  # ]
  # $template_list          = [
  #   'repository/conf/carbon.xml',
  #   'repository/conf/user-mgt.xml',
  #   'repository/conf/registry.xml',
  #   'repository/conf/datasources/master-datasources.xml',
  #   'repository/conf/datasources/am-datasources.xml',
  #   'repository/conf/tomcat/catalina-server.xml',
  #   'repository/conf/axis2/axis2.xml',
  #   'repository/conf/security/authenticators.xml',
  #   'bin/wso2server.sh'
  # ]
  # $file_list              = []
  # $system_file_list       = []
  # $directory_list         = []
  # $hosts_mapping          = {
  #   localhost => {
  #     ip => '127.0.0.1',
  #     name => 'localhost'
  #   }
  # }
  # $master_datasources     = {
  #   wso2_carbon_db  => {
  #     name => 'WSO2_CARBON_DB',
  #     description => 'The datasource used for registry and user manager',
  #     driver_class_name => 'org.h2.Driver',
  #     url => 'jdbc:h2:repository/database/WSO2CARBON_DB;DB_CLOSE_ON_EXIT=FALSE;LOCK_TIMEOUT=60000',
  #     username => 'wso2carbon',
  #     password => 'wso2carbon',
  #     jndi_config => 'jdbc/WSO2CarbonDB',
  #     max_active => '50',
  #     max_wait => '60000',
  #     test_on_borrow => true,
  #     default_auto_commit => false,
  #     validation_query => 'SELECT 1',
  #     validation_interval => '30000'
  #   }
  # }
  # $registry_mounts        = []
  # $carbon_home_symlink    = "/mnt/${::product_name}-${::product_version}"
  # $wso2_user              = 'wso2user'
  # $wso2_group             = 'wso2'
  # $maintenance_mode       = 'refresh'
  # $install_mode           = 'file_bucket'
  # $install_dir            = "/mnt/${::ipaddress}"
  # $pack_dir               = '/mnt/packs'
  # $pack_filename          = "${::product_name}-${::product_version}.zip"
  # $pack_extracted_dir     = "${::product_name}-${::product_version}"
  # $hostname               = 'localhost'
  # $mgt_hostname           = 'apim.wso2.com'
  # $worker_node            = false
  # $patches_dir            = 'repository/components/patches'
  # $service_name           = "${::product_name}"
  # $service_template       = 'wso2base/wso2service.erb'
  # $usermgt_datasource     = 'wso2_carbon_db'
  # $local_reg_datasource   = 'wso2_carbon_db'
  # $clustering             = {
  #   enabled => false,
  #   membership_scheme => 'wka',
  #   domain => 'wso2.carbon.domain',
  #   local_member_host => '127.0.0.1',
  #   local_member_port => '4000',
  #   sub_domain => 'mgt',
  #   wka => {
  #     members => [
  #       {
  #         hostname => '127.0.0.1',
  #         port => 4000
  #       }
  #     ]
  #   }
  # }
  # $dep_sync               = {
  #   enabled => false
  # }
  # $ports                  = {
  #   offset => 0
  # }
  # $jvm                    = {
  #   xms => '256m',
  #   xmx => '1024m',
  #   max_perm_size => '256m'
  # }
  # $ipaddress              = "${::ipaddress}"
  # $fqdn                   = "${::fqdn}"
  # $sso_authentication     = {
  #   enabled => false
  # }
  # $user_management        = {
  #   admin_role      => 'admin',
  #   admin_username  => 'admin',
  #   admin_password  => 'admin'
  # }
  # $enable_secure_vault    = false
  # $key_stores             = {
  #   key_store => {
  #     location => 'repository/resources/security/wso2carbon.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon',
  #     key_alias => 'wso2carbon',
  #     key_password => 'wso2carbon'
  #   },
  #   registry_key_store => {
  #     location => 'repository/resources/security/wso2carbon.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon',
  #     key_alias => 'wso2carbon',
  #     key_password => 'wso2carbon'
  #   },
  #   trust_store => {
  #     location => 'repository/resources/security/client-truststore.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon'
  #   },
  #   connector_key_store => {
  #     location => 'repository/resources/security/wso2carbon.jks',
  #     password => 'wso2carbon'
  #   },
  #   user_trusted_rp_store => {
  #     location => 'repository/resources/security/userRP.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon',
  #     key_password => 'wso2carbon'
  #   }
  # }
  # # common parameters - end
}