# A "dummy" CA for testing

.PHONY: clean help veryclean

%.pem: %.csr
	@openssl ca -config openssl.cnf -extensions v3_user -in $< -out $@ -notext

%.csr: ca.key ca.pem
	@openssl req -config openssl.cnf -out $@ -new -newkey rsa:2048 -nodes -keyout keys/$(*F).key

help:
	@echo "Usage: make <foo>.pem"

ca.key ca.pem:
	mkdir -p certs keys db
	openssl req -config openssl.cnf -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout ca.key -out ca.pem
	touch db/index
	echo 0000 > db/serial

clean:
	rm -rf certs keys db

veryclean: clean
	rm -rf ca.key *.pem
