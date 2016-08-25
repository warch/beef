FROM ubuntu
MAINTAINER Christopher Warmbold (warch)

RUN apt-get update && apt-get install -y \
	curl \
	git

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
	;curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable \
	;. /usr/local/rvm/scripts/rvm \
	;rvm install 2.1.5 \
	;rvm use 2.1.5 -- default \
	;gem install bundler \
	;git clone git://github.com/beefproject/beef.git \
	;cd beef \
	;bundle install \
	&& rm -rf /var/lib/apt/lists/* \
        ;rm -Rf /var/cache \
        ;apt-get autoremove -y


EXPOSE 3000

CMD ["ruby /beef/beef"]
