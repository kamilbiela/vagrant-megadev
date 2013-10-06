# Gem packages
# ==============

package ruby ruby-dev

gem_packages_list = %w(
  jekyll kramdown
) 

gem_packages_list.each do |name| 
  gem_package name do 
    action :install
  end
end