#!/usr/bin/env bash

RUBY_ARCHIVE="ruby-$RUBY_VERSION.tar.bz2"
RUBY_URL="http://ftp.ruby-lang.org/pub/ruby/${RUBY_VERSION:0:3}/$RUBY_ARCHIVE"

#
# Configures Ruby.
#
function configure_ruby()
{
	log "Configuring ruby $RUBY_VERSION ..."

	if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
		./configure --prefix="$INSTALL_DIR" \
			    --with-opt-dir="$(brew --prefix openssl):$(brew --prefix readline):$(brew --prefix libyaml):$(brew --prefix gdbm):$(brew --prefix libffi)" \
			    $CONFIGURE_OPTS
	else
		./configure --prefix="$INSTALL_DIR" $CONFIGURE_OPTS
	fi
}

#
# Compiles Ruby.
#
function compile_ruby()
{
	log "Compiling ruby $RUBY_VERSION ..."
	make
}

#
# Installs Ruby into $INSTALL_DIR
#
function install_ruby()
{
	log "Installing ruby $RUBY_VERSION ..."
	make install
}
