npm:
	npm

serve:
	hugo server \
		--buildDrafts \
		--buildFuture \
		--disableFastRender

production-build:
	hugo \
		--minify

	make check-internal-links

preview-build:
	hugo \
		--baseURL $(DEPLOY_PRIME_URL) \
		--buildDrafts \
		--buildFuture \
		--minify

	make check-internal-links

install-link-checker:
	curl https://raw.githubusercontent.com/wjdp/htmltest/master/godownloader.sh | bash

check-internal-links: install-link-checker
	bin/htmltest

check-external-links:
	bin/htmltest --conf .htmltest.external.yml
