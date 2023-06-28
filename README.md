# libssh2 Issue 1107

Problem might be in `libssh2_userauth_publickey_frommemory`.

- *Could probably do a repro without step 1, but wasn't sure simplest way.*
- *Also should be able to make a much tighter repro just with `libssh2_userauth_publickey_frommemory`*

Running `make`:

- generates a keypair (**please install the public key in github**)
- fetches the [patched version of rugged](https://github.com/libgit2/rugged/pull/956) that uses `libssh2_userauth_publickey_frommemory`
- builds a docker image with libssh2, libgit2, rugged, ruby
- runs said docker image and show that the OpenSSL error 'stack' is not cleared properly (even though all operations succeed)

You should see the following output (or something similar):

```
Rugged  version: 1.5.0.1
libgit2 version: [1, 5, 0]
OpenSSL version: 2.1.4
Rugged features: [:threads, :https, :ssh]

OpenSSL errors: 0
total 28K
-rw-r--r-- 1 root root    0 Jun 28 12:49 FETCH_HEAD
-rw-r--r-- 1 root root   23 Jun 28 12:48 HEAD
-rw-r--r-- 1 root root  239 Jun 28 12:49 config
-rw-r--r-- 1 root root   73 Jun 28 12:48 description
drwxr-xr-x 2 root root 4.0K Jun 28 12:48 hooks
drwxr-xr-x 2 root root 4.0K Jun 28 12:48 info
drwxr-xr-x 4 root root 4.0K Jun 28 12:48 objects
drwxr-xr-x 5 root root 4.0K Jun 28 12:49 refs
OpenSSL errors: 0
total 28K
-rw-r--r-- 1 root root    0 Jun 28 12:49 FETCH_HEAD
-rw-r--r-- 1 root root   23 Jun 28 12:49 HEAD
-rw-r--r-- 1 root root  239 Jun 28 12:49 config
-rw-r--r-- 1 root root   73 Jun 28 12:49 description
drwxr-xr-x 2 root root 4.0K Jun 28 12:49 hooks
drwxr-xr-x 2 root root 4.0K Jun 28 12:49 info
drwxr-xr-x 4 root root 4.0K Jun 28 12:49 objects
drwxr-xr-x 5 root root 4.0K Jun 28 12:49 refs
OpenSSL errors: 1
```
