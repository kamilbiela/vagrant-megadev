include_recipe "apache2"


packages_list = %w(
  php5-memcache php5-gd php5-curl php5-mysql php5-xdebug php5-xsl php5-imagick php5-sqlite php5-sqlite
)

packages_list.each do |name| 
  package name do 
    action :install
  end
end

template "/etc/php5/mods-available/xdebug.ini" do
  mode 0644
  owner "root"
  group "root"
end

# configure sites from .vagrantuser file
# ======================================
node['user_projects'].each do |entry|
  web_app entry["host"] do
    server_name entry["host"]
    docroot "/var/www/" + entry["host"] + entry["web_dir"]
    notifies :restart, "service[apache2]"
  end
end