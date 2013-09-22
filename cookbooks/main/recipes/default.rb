include_recipe "apache2"

# Apt packages
# ==============

packages_list = %w(
  mc fish ruby-dev
  php5-memcache php5-gd php5-curl php5-mysql php5-xdebug php5-xsl php5-imagick php5-sqlite php5-sqlite
)

packages_list.each do |name| 
  package name do 
    action :install
  end
end


# Node packages
# ===============

node_packages_list = %w(
  bower coffee-script
)

node_packages_list.each do |name| 
  node_npm name do 
    action :install
  end
end 

# Gem packages
# ==============

gem_packages_list = %w(
  jekyll kramdown
) 

gem_packages_list.each do |name| 
  gem_package name do 
    action :install
  end
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
