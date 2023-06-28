# libssh2 Issue 1107

Problem might be in `libssh2_userauth_publickey_frommemory`.

*Could probably do a repro without step 1, but wasn't sure simplest way.*

Running `make`:

- generates a keypair (**please install the public key in github**)
- fetches the [patched version of rugged](https://github.com/libgit2/rugged/pull/956) that uses `libssh2_userauth_publickey_frommemory`
- builds a docker image with libssh2, libgit2, rugged, ruby
- runs said docker image and show that the OpenSSL error 'stack' is not cleared properly (even though all operations succeed)
