# Apt packages
# ==============

packages_list = %w(
  mc fish
)

packages_list.each do |name| 
  package name do 
    action :install
  end
end

