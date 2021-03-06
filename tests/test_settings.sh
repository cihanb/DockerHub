#!/bin/sh

# The MIT License (MIT)
#
# Copyright (c) 2015 Redis Labs
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Script Name: settings.sh
# Author: Cihan Biyikoglu - github:(cihanb)

#images to test
test_enterprise_images=("redislabs/redis"  "redislabs/redis:latest" "redislabs/redis:4.4.2-46" "redislabs/redis:4.5.0-18" "redislabs/redis:4.5.0-22" "redislabs/redis:4.5.0-31" "redislabs/redis:4.5.0-35" "redislabs/redis:4.5.0-43" "redislabs/redis:4.5.0-51" "redislabs/redis:5.0.0-31" "redislabs/redis:5.0.1-22-beta")
test_oss_images=("redislabs/redisearch"  "redislabs/rejson" "redislabs/rebloom")

##rp settings
#total number of nodes to set up
rp_total_nodes=1
#container ame prefix - each node get a number added based on nodecount
rp_container_name_prefix="rp"
#container resources
rp_container_ram="6GB"
rp_container_cpus=2
#cluster name
rp_fqdn="cluster.rp.local"
#TODO: change this username
rp_admin_account_name="cihan@redislabs.com"
#TODO: change this password
rp_admin_account_password="redislabs123"
#docker network name for the cluster
rp_network_name="redis_net"
#start admin UI and rest API ports from 8443 and 9443 and +1 per node
rp_admin_ui_port=8443
rp_admin_restapi_port=9443
rp_db_port=12000
rp_host_name=172.17.0.2 #typically the default ip address

#open source settings
oss_db_port=6379
oss_host_name="localhost"
oss_container_name_prefix="redis"

#misc settings
sleep_time_in_seconds=150

#print colors
info_color=""
warning_color=""
error_color=""
no_color=""