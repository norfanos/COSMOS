# encoding: ascii-8bit

# Copyright � 2014 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt

require 'spec_helper'
require 'cosmos/core_ext/socket'

describe Socket do
  describe "get_own_ip_address" do
    it "should return the ip address of the current machine" do
      Socket.get_own_ip_address.should match /\b(?:\d{1,3}\.){3}\d{1,3}\b/
    end
  end

  describe "lookup_hostname_from_ip" do
    it "should return the hostname for the ip address" do
      ipaddr = Resolv.getaddress "www.ball.com"
      Socket.lookup_hostname_from_ip(ipaddr).should match "ball.com"
    end
  end
end