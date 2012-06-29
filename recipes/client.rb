
%w( openvpn ).each do |p|
  package p
end

service "openvpn"

directory "/etc/openvpn" do
  owner "root"
  group "root"
  mode "0644"
end

template "/etc/openvpn/client.conf" do
  source "client-conf.erb"
  owner "root"
  group "root"
  mode "0644"

  not_if { File.exists?(File.join("/", "etc", "openvpn", "client.conf")) }
end

template "/etc/openvpn/vpn-up" do
  source "vpn-up.erb"
  owner "root"
  group "root"
  mode "0755"

  not_if { File.exists?(File.join("/", "etc", "openvpn", "vpn-up")) }
end

template "/etc/openvpn/vpn-down" do
  source "vpn-down.erb"
  owner "root"
  group "root"
  mode "0755"

  not_if { File.exists?(File.join("/", "etc", "openvpn", "vpn-down")) }
end

template "/etc/openvpn/ca.crt" do
  source "ca-crt.erb"
  owner "root"
  group "root"
  mode "0644"
  variables :ca_key => node['openvpn']['ca_crt']

  not_if { File.exists?(File.join("/", "etc", "openvpn", "ca.crt")) }
end

template "/etc/openvpn/client.crt" do
  source "client-crt.erb"
  owner "root"
  group "root"
  mode "0644"
  variables :client_crt => node['openvpn']['client_crt']

  not_if { File.exists?(File.join("/", "etc", "openvpn", "client.crt")) }
end

template "/etc/openvpn/client.key" do
  source "client-key.erb"
  owner "root"
  group "root"
  mode "0644"
  variables :client_key => node['openvpn']['client_key']

  not_if { File.exists?(File.join("/", "etc", "openvpn", "client.key")) }
end

template "/etc/openvpn/ta.key" do
  source "ta-key.erb"
  owner "root"
  group "root"
  mode "0644"
  variables :ta_key => node['openvpn']['ta_key']

  not_if { File.exists?(File.join("/", "etc", "openvpn", "ta.key")) }
end
