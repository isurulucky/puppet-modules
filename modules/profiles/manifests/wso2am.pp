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

  $am_datasources     = hiera('wso2::am_datasources')
  $apim_gateway       = hiera('wso2::apim_gateway')
  $apim_keymanager    = hiera('wso2::apim_keymanager')
  $apim_publisher     = hiera('wso2::apim_publisher')
  $apim_store         = hiera('wso2::apim_store')
  $apim_traffic_manager = hiera('wso2::apim_traffic_manager', { })
  $is_datasource      = hiera('wso2::is_datasource')
  $am_datasource      = hiera('wso2::am_datasource')
  $enable_advance_throttling = hiera('wso2::enable_advance_throttling', { })
  $key_validator_client_type = hiera('wso2::key_validator_client_type', { })
  $enable_thrift_server = hiera('wso2::enable_thrift_server', { })
  $thrift_server_host = hiera('wso2::thrift_server_host', { })
  $key_store = hiera('wso2::key_store', { })
  $trust_store = hiera('wso2::trust_store', { })
  $enable_data_publisher = hiera('wso2::enable_data_publisher', { })
  $enable_block_condition = hiera('wso2::enable_block_condition', { })
  $enable_jms_connection_details = hiera('wso2::enable_jms_connection_details', { })
  $apim_gateway_disable_jms_event_parameters = hiera('wso2::apim_gateway_disable_jms_event_parameters', "false")
  $enable_traffic_manager_specific_axis2_configurations = hiera('wso2::enable_traffic_manager_specific_axis2_configurations', "false")
  $enable_traffic_manager_specific_registry_configurations = hiera('wso2::enable_traffic_manager_specific_registry_configurations', "false")

  class { '::wso2am':
    template_list             => $template_list,
    am_datasources            => $am_datasources,
    apim_gateway              => $apim_gateway,
    apim_keymanager           => $apim_keymanager,
    apim_publisher            => $apim_publisher,
    apim_store                => $apim_store,
    apim_traffic_manager      => $apim_traffic_manager,
    is_datasource             => $is_datasource,
    am_datasource             => $am_datasource,
    enable_advance_throttling => $enable_advance_throttling,
    key_validator_client_type => $key_validator_client_type,
    enable_thrift_server      => $enable_thrift_server,
    thrift_server_host        => $thrift_server_host,
    key_store                 => $key_store,
    trust_store               => $trust_store,
    enable_data_publisher     => $enable_data_publisher,
    enable_block_condition    => $enable_block_condition,
    enable_jms_connection_details => $enable_jms_connection_details,
    apim_gateway_disable_jms_event_parameters => $apim_gateway_disable_jms_event_parameters,
    enable_traffic_manager_specific_axis2_configurations => $enable_traffic_manager_specific_axis2_configurations,
    enable_traffic_manager_specific_registry_configurations => $enable_traffic_manager_specific_registry_configurations
  }
}