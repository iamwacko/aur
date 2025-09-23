include packages

.PHONY: pull
pull:
	$(foreach var,$(packages), git clone aur@aur.archlinux.org:$(var).git aur/$(var);)

.PHONY: check
check:
	pkgctl version check $(filter-out $(wildcard aur/*-git),$(wildcard aur/*))


.PHONY: upgrade
upgrade:
	pkgctl version upgrade $(filter-out $(wildcard aur/*-git),$(wildcard aur/*))

.PHONY: git-clean
git-clean:
	$(foreach var,$(packages), cd aur/$(var); git clean -fdx; cd '../..';)

.PHONY: clean
clean:
	rm -rf aur

.PHONY: build
build:
	$(foreach var,$(packages), paru --chroot -B aur/$(var))
