# ------------------------------------------------------------------------------
# Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

# Manages WSO2 API Manager deployment
class wso2am (

  # apim specific parameters - start
  $template_list             = $wso2am::params::template_list,
  $am_datasources            = $wso2am::params::am_datasources,
  $apim_gateway              = $wso2am::params::apim_gateway,
  $apim_keymanager           = $wso2am::params::apim_keymanager,
  $apim_publisher            = $wso2am::params::apim_publisher,
  $apim_store                = $wso2am::params::apim_store,
  $apim_traffic_manager      = $wso2am::params::apim_traffic_manager,
  $is_datasource             = $wso2am::params::is_datasource,
  $am_datasource             = $wso2am::params::am_datasource,
  $enable_advance_throttling = $wso2am::params::enable_advance_throttling,
  $key_validator_client_type = $wso2am::params::key_validator_client_type,
  $enable_thrift_server      = $wso2am::params::enable_thrift_server,
  $thrift_server_host        = $wso2am::params::thrift_server_host,
  $key_store                 = $wso2am::params::key_store,
  $trust_store               = $wso2am::params::trust_store,
  $enable_data_publisher     = $wso2am::params::enable_data_publisher,
  $enable_block_condition    = $wso2am::params::enable_block_condition,
  $enable_jms_connection_details = $wso2am::params::enable_jms_connection_details,
  $apim_gateway_disable_jms_event_parameters = $wso2am::params::apim_gateway_disable_jms_event_parameters,
  $enable_traffic_manager_specific_axis2_configurations = $wso2am::params::enable_traffic_manager_specific_axis2_configurations,
  $enable_traffic_manager_specific_registry_configurations = $wso2am::params::enable_traffic_manager_specific_registry_configurations,
  # apim specific parameters - end

  # other paramaters - start
  $java_class             = $wso2base::params::java_class,
  $java_prefs_system_root = $wso2base::params::java_prefs_system_root,
  $java_prefs_user_root   = $wso2base::params::java_prefs_user_root,
  $java_home              = $wso2base::params::java_home,

  # system configuration data
  $packages               = $wso2base::params::packages,
  $file_list              = $wso2base::params::file_list,
  $system_file_list       = $wso2base::params::system_file_list,
  $directory_list         = $wso2base::params::directory_list,
  $hosts_mapping          = $wso2base::params::hosts_mapping,

  $master_datasources     = $wso2base::params::master_datasources,
  $registry_mounts        = $wso2base::params::registry_mounts,
  $carbon_home_symlink    = $wso2base::params::carbon_home_symlink,
  $wso2_user              = $wso2base::params::wso2_user,
  $wso2_group             = $wso2base::params::wso2_group,
  $maintenance_mode       = $wso2base::params::maintenance_mode,
  $install_mode           = $wso2base::params::install_mode,
  $install_dir            = $wso2base::params::install_dir,
  $pack_dir               = $wso2base::params::pack_dir,
  $pack_filename          = $wso2base::params::pack_filename,
  $pack_extracted_dir     = $wso2base::params::pack_extracted_dir,
  $hostname               = $wso2base::params::hostname,
  $mgt_hostname           = $wso2base::params::mgt_hostname,
  $worker_node            = $wso2base::params::worker_node,
  $patches_dir            = $wso2base::params::patches_dir,
  $service_name           = $wso2base::params::service_name,
  $service_template       = $wso2base::params::service_template,
  $usermgt_datasource     = $wso2base::params::usermgt_datasource,
  $local_reg_datasource   = $wso2base::params::local_reg_datasource,
  $clustering             = $wso2base::params::clustering,
  $dep_sync               = $wso2base::params::dep_sync,
  $ports                  = $wso2base::params::ports,
  $jvm                    = $wso2base::params::jvm,
  $ipaddress              = $wso2base::params::ipaddress,
  $fqdn                   = $wso2base::params::fqdn,
  $sso_authentication     = $wso2base::params::sso_authentication,
  $user_management        = $wso2base::params::user_management,
  $enable_secure_vault    = $wso2base::params::enable_secure_vault,
  $key_stores             = $wso2base::params::key_stores

  # other paramaters - end

) inherits wso2am::params {

  $carbon_home          = "${install_dir}/${pack_extracted_dir}"

  if ($enable_secure_vault == true) {
    $secure_vault_configs = hiera('wso2::secure_vault_configs')
    $key_store_password   = $secure_vault_configs['key_store_password']['password']
  }

  # marathon-lb cert configs
  if ($::platform == 'mesos') {
    $marathon_lb_cert_config = hiera('wso2::marathon_lb_cert_config')
    $marathon_lb_cert_config_enabled = $marathon_lb_cert_config['enabled']
    if ($marathon_lb_cert_config_enabled == true){
      $trust_store_password   = $marathon_lb_cert_config['trust_store_password']
      $cert_file = $marathon_lb_cert_config['cert_file']
    }
  }

  class { '::wso2base::system':
    packages         => $packages,
    wso2_group       => $wso2_group,
    wso2_user        => $wso2_user,
    service_name     => $service_name,
    service_template => $service_template,
    hosts_mapping    => $hosts_mapping
  }

  require $java_class

  wso2base::server { $carbon_home:
    maintenance_mode    => $maintenance_mode,
    pack_filename       => $pack_filename,
    pack_dir            => $pack_dir,
    carbon_home_symlink => $carbon_home_symlink,
    install_mode        => $install_mode,
    install_dir         => $install_dir,
    pack_extracted_dir  => $pack_extracted_dir,
    wso2_user           => $wso2_user,
    wso2_group          => $wso2_group,
    patches_dir         => $patches_dir,
    service_name        => $service_name,
    service_template    => $service_template,
    template_list       => $template_list,
    directory_list      => $directory_list,
    file_list           => $file_list,
    system_file_list    => $system_file_list,
    enable_secure_vault => $enable_secure_vault,
    key_store_password  => $key_store_password
  }
}