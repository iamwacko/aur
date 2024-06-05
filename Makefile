include packages

.PHONY: pull
pull:
	$(foreach var,$(packages), git clone aur@aur.archlinux.org:$(var).git aur/$(var);)

.PHONY: check
check:
	$(foreach var,$(packages), pkgctl version check aur/$(var))

.PHONY: clean
clean:
	rm -rf aur
