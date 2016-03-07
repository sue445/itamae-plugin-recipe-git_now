describe file("#{node[:git_now][:prefix]}/bin/git-now") do
  it { should be_file }
  it { should be_executable }
end
