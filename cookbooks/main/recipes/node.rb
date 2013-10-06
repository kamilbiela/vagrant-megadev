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
