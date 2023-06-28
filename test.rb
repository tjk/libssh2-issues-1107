require "openssl"
require "rugged"

puts "Rugged  version: #{Rugged::VERSION}"
puts "libgit2 version: #{Rugged.libgit2_version}"
puts "OpenSSL version: #{OpenSSL::VERSION}"
puts "Rugged features: #{Rugged.features}"

puts

puts "OpenSSL errors: #{OpenSSL.errors.size}"

#`yes | ssh-keygen -t ed25519 -f key -N '' -C libssh2-issues-1107`

repo_url = "ssh://git@github.com/libssh2/libssh2.git"

ssh_key = Rugged::Credentials::SshKey.new(username: "git", publickey: "/key.pub", privatekey: "/key")
Rugged::Repository.clone_at(repo_url, "/tmp/ssh_key", credentials: ssh_key, bare: true)
puts `ls -lh /tmp/ssh_key`

puts "OpenSSL errors: #{OpenSSL.errors.size}"

ssh_key_memory = Rugged::Credentials::SshKeyMemory.new(username: "git", publickey: `cat /key.pub`, privatekey: `cat /key`)
Rugged::Repository.clone_at(repo_url, "/tmp/ssh_key_memory", credentials: ssh_key_memory, bare: true)
puts `ls -lh /tmp/ssh_key_memory`

puts "OpenSSL errors: #{OpenSSL.errors.size}"