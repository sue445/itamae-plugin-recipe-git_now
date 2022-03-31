node.reverse_merge!(
  git_now: {
    prefix: "/usr/local",
    scheme: "https",
  },
)

node[:git_now][:src] ||= "#{node[:git_now][:prefix]}/src"

package "git"
package "make"

case node[:platform]
when 'redhat'
  package "which"
end

install_dir = "#{node[:git_now][:src]}/git-now"

git install_dir do
  repository "#{node[:git_now][:scheme]}://github.com/iwata/git-now.git"
  revision   node[:git_now][:revision] if node[:git_now][:revision]
  recursive  true
end

execute "make prefix=#{node[:git_now][:prefix]} install" do
  cwd     install_dir
  not_if "ls #{node[:git_now][:prefix]}/bin/git-now"
end
