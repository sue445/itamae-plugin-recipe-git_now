node.reverse_merge!(
  git_now: {
    prefix: "/usr/local",
    scheme: "git",
  },
)

node[:git_now][:src] ||= "#{node[:git_now][:prefix]}/src"

package "git"

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
