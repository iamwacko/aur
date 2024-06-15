include packages

.PHONY: pull
pull:
	$(foreach var,$(packages), git clone aur@aur.archlinux.org:$(var).git aur/$(var);)

.PHONY: check
check:
	pkgctl version check aur/* 

.PHONY: upgrade
upgrade:
	pkgctl version upgrade aur/* 

.PHONY: clean
clean:
	rm -rf aur

.PHONY: build
build:
	$(foreach var,$(packages), cd aur/$(var) && paru -B .)
