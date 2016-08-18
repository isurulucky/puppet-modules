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

class profiles::wso2base {

  $_java_class             = hiera('java_class')
  $_java_prefs_system_root = hiera('java_prefs_system_root')
  $_java_prefs_user_root   = hiera('java_prefs_user_root')
  $_java_home              = hiera('java_home')

  # system configuration data
  $_packages             = hiera_array('packages')
  $_template_list        = hiera_array('wso2::template_list')
  $_file_list            = hiera_array('wso2::file_list')
  $_system_file_list     = hiera_array('wso2::system_file_list')
  $_directory_list       = hiera_array('wso2::directory_list', [])
  $_hosts_mapping        = hiera_hash('wso2::hosts_mapping')

  $_master_datasources   = hiera_hash('wso2::master_datasources')
  $_registry_mounts      = hiera_hash('wso2::registry_mounts', { })
  $_carbon_home_symlink  = hiera('wso2::carbon_home_symlink')
  $_wso2_user            = hiera('wso2::user')
  $_wso2_group           = hiera('wso2::group')
  $_maintenance_mode     = hiera('wso2::maintenance_mode')
  $_install_mode         = hiera('wso2::install_mode')
  $_install_dir          = hiera('wso2::install_dir')
  $_pack_dir             = hiera('wso2::pack_dir')
  $_pack_filename        = hiera('wso2::pack_filename')
  $_pack_extracted_dir   = hiera('wso2::pack_extracted_dir')
  $_hostname             = hiera('wso2::hostname')
  $_mgt_hostname         = hiera('wso2::mgt_hostname')
  $_worker_node          = hiera('wso2::worker_node')
  $_patches_dir          = hiera('wso2::patches_dir')
  $_service_name         = hiera('wso2::service_name')
  $_service_template     = hiera('wso2::service_template')
  $_usermgt_datasource   = hiera('wso2::usermgt_datasource')
  $_local_reg_datasource = hiera('wso2::local_reg_datasource')
  $_clustering           = hiera('wso2::clustering')
  $_dep_sync             = hiera('wso2::dep_sync')
  $_ports                = hiera('wso2::ports')
  $_jvm                  = hiera('wso2::jvm')
  $_ipaddress            = hiera('wso2::ipaddress')
  $_fqdn                 = hiera('wso2::fqdn')
  $_sso_authentication   = hiera('wso2::sso_authentication')
  $_user_management      = hiera('wso2::user_management')
  $_enable_secure_vault  = hiera('wso2::enable_secure_vault')
  $_key_stores           = hiera('wso2::key_stores')

  $_carbon_home          = "${_install_dir}/${_pack_extracted_dir}"

  include '::wso2base'
}