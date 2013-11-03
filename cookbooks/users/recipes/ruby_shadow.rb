#
# Cookbook Name:: users
# Recipe:: ruby_shadow
#
# Copyright 2012, Alex Dergachev
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Installs ruby-shadow / libshadow-ruby1.8 for working with passwords
# In theory, "package 'libshadow-ruby1.8" should suffice, but it seems to work only on the first chef-solo run.
##  $ sudo apt-get install libshadow-ruby1.8 # already installed
##  $ ruby -rshadow -e'print "\n this will crash"' # ruby: no such file to load -- shadow (LoadError)

# The following workaround is based on the following: 
# - see http://wiki.opscode.com/display/chef/Resources#Resources-Prerequisites
# - see http://tickets.opscode.com/browse/CHEF-2848
# - see https://github.com/opscode/chef/blob/master/chef/lib/chef/provider/user.rb

# package "libshadow-ruby1.8"
package "build-essential" 
gem_package "ruby-shadow"
