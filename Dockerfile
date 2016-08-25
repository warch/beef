FROM ruby
MAINTAINER Christopher Warmbold (warch)

#RUN apt-get update && apt-get install -y \
#	git

RUN /bin/bash -c "git clone git://github.com/beefproject/beef.git \
	&& cd beef \
	&& bundle install"

EXPOSE 3000

WORKDIR /beef

CMD ["ruby", "beef"]
