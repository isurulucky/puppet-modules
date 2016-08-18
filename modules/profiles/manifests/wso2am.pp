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

class profiles::wso2am inherits profiles::wso2base {

  $_am_datasources     = hiera('wso2::am_datasources')
  $_apim_gateway       = hiera('wso2::apim_gateway')
  $_apim_keymanager    = hiera('wso2::apim_keymanager')
  $_apim_publisher     = hiera('wso2::apim_publisher')
  $_apim_store         = hiera('wso2::apim_store')
  $_apim_traffic_manager = hiera('wso2::apim_traffic_manager', { })
  $_is_datasource      = hiera('wso2::is_datasource')
  $_am_datasource      = hiera('wso2::am_datasource')
  $_enable_advance_throttling = hiera('wso2::enable_advance_throttling', { })
  $_key_validator_client_type = hiera('wso2::key_validator_client_type', { })
  $_enable_thrift_server = hiera('wso2::enable_thrift_server', { })
  $_thrift_server_host = hiera('wso2::thrift_server_host', { })
  $_key_store = hiera('wso2::key_store', { })
  $_trust_store = hiera('wso2::trust_store', { })
  $_enable_data_publisher = hiera('wso2::enable_data_publisher', { })
  $_enable_block_condition = hiera('wso2::enable_block_condition', { })
  $_enable_jms_connection_details = hiera('wso2::enable_jms_connection_details', { })
  $_apim_gateway_disable_jms_event_parameters = hiera('wso2::apim_gateway_disable_jms_event_parameters', "false")
  $_enable_traffic_manager_specific_axis2_configurations = hiera('wso2::enable_traffic_manager_specific_axis2_configurations', "false")
  $_enable_traffic_manager_specific_registry_configurations = hiera('wso2::enable_traffic_manager_specific_registry_configurations', "false")

  notice("WSO2 product profile class [name] $title")

  class { '::wso2am':
    # apim specific parameters - start
    template_list             => $_template_list,
    am_datasources            => $_am_datasources,
    apim_gateway              => $_apim_gateway,
    apim_keymanager           => $_apim_keymanager,
    apim_publisher            => $_apim_publisher,
    apim_store                => $_apim_store,
    apim_traffic_manager      => $_apim_traffic_manager,
    is_datasource             => $_is_datasource,
    am_datasource             => $_am_datasource,
    enable_advance_throttling => $_enable_advance_throttling,
    key_validator_client_type => $_key_validator_client_type,
    enable_thrift_server      => $_enable_thrift_server,
    thrift_server_host        => $_thrift_server_host,
    key_store                 => $_key_store,
    trust_store               => $_trust_store,
    enable_data_publisher     => $_enable_data_publisher,
    enable_block_condition    => $_enable_block_condition,
    enable_jms_connection_details => $_enable_jms_connection_details,
    apim_gateway_disable_jms_event_parameters => $_apim_gateway_disable_jms_event_parameters,
    enable_traffic_manager_specific_axis2_configurations => $_enable_traffic_manager_specific_axis2_configurations,
    enable_traffic_manager_specific_registry_configurations => $_enable_traffic_manager_specific_registry_configurations,
    # apim specific parameters - end

    # system configuration data
    packages                  => $_packages,
    file_list                 => $_file_list,
    system_file_list          => $_system_file_list,
    directory_list            => $_directory_list,
    hosts_mapping             => $_hosts_mapping,

    master_datasources        => $_master_datasources,
    registry_mounts           => $_registry_mounts,
    carbon_home_symlink       => $_carbon_home_symlink,
    wso2_user                 => $_wso2_user,
    wso2_group                => $_wso2_group,
    maintenance_mode          => $_maintenance_mode,
    install_mode              => $_install_mode,
    install_dir               => $_install_dir,
    pack_dir                  => $_pack_dir,
    pack_filename             => $_pack_filename,
    pack_extracted_dir        => $_pack_extracted_dir,
    hostname                  => $_hostname,
    mgt_hostname              => $_mgt_hostname,
    worker_node               => $_worker_node,
    patches_dir               => $_patches_dir,
    service_name              => $_service_name,
    service_template          => $_service_template,
    usermgt_datasource        => $_usermgt_datasource,
    local_reg_datasource      => $_local_reg_datasource,
    clustering                => $_clustering,
    dep_sync                  => $_dep_sync,
    ports                     => $_ports,
    jvm                       => $_jvm,
    ipaddress                 => $_ipaddress,
    fqdn                      => $_fqdn,
    sso_authentication        => $_sso_authentication,
    user_management           => $_user_management,
    enable_secure_vault       => $_enable_secure_vault,
    key_stores                => $_key_stores
  }
}