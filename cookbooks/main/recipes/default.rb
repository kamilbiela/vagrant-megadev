include_recipe "apache2"

package "mc" do
  action :install
end

package "fish" do
  action :install
end

# install php packages
# ====================

package "php5-memcache" do
  action :install
end

package "php5-gd" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-mysql" do
  action :install
end

package "php5-xdebug" do
  action :install
end

package "php5-xsl" do
  action :install
end

package "php5-imagick" do
  action :install
end

package "php5-sqlite" do
  action :install
end

# install node packages
# =====================

node_npm "bower" do
    action :install
end

node_npm "coffee-script" do
    action :install
end

node['user_projects'].each do |entry|
  web_app entry["host"] do
    server_name entry["host"]
    docroot "/var/www/" + entry["host"] + entry["web_dir"]
  end
end
