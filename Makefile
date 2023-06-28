default: key.pub
	docker build . -t libssh2-issues-1107
	docker run libssh2-issues-1107

key.pub:
	yes | ssh-keygen -t ed25519 -f key -N '' -C libssh2-issues-1107
	echo 'PLEASE INSTALL THE FOLLOWING KEY IN GITHUB AT https://github.com/settings/keys'
	cat key.pub