case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"

when "redhat"
  if node[:platform_version].to_f >= 8.0
    # FIXME: Workaround for following
    # Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist
    execute "sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\\/\\/mirror/baseurl=http:\\/\\/vault/g' /etc/yum.repos.d/CentOS-*repo"
  end
end

include_recipe "git_now"
