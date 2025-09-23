# My AUR Package Maintenance

## Process
`make pull` to git clone all packages I maintain, from the list in `packages`. I can then run `make check` or `make upgrade` to check for upstream updates, using pkgctl and nvchecker. If there's any updates, I'll go into the cloned repo, run `../../srcinfo` to update the hashes, and then run `paru -B .`to see if it builds right. I'll make whatever fixes I need, then I'll add the changed files, commit them, and push. 

I can also run `make build` to see if any of my packages are failing to build for one reason or another. Once I'm done for the day I can just run `make git-clean` to remove any files I haven't already pushed. If I'm done completely I can just run `make clean`.

To maintain a new package, I just add it to the `packages` list, and then in it's cloned repo get the PKGBUILD, .SRCINFO, and .nvchecker.toml working, along with any other miscallenous files. To remove a package, I'll do whatever associated action on the AUR website, then I delete it from the list and delete the cloned repo.

## Dependencies
- `paru`
- `nvchecker`
- `devtools`
- `base-devel`

## What packages aren't here
Some packages have issues that mean they don't really fit in here, but I'm still the AUR maintainer.

- ruget-bin: The author hasn't released new binaries in a while, despite having new releases
- finalcrypt: They don't seem to use any kind of VCS or anything, so I don't want to bother figuring out how make a .nvchecker.toml for it.

## Upstream changes?
Some upstreams have errors, or are unmaintained. I might want to help.

- cargo-benchcmp: warnings during build
- cargo-docs: failed to build
- cwtch-server: files can't be removed
- cwtch-server-git: same as non -git
- doitlive: fails to build
- ede: fails to build
- libcwtch-go: files can't be removed
- libcwtch-go-git: files can't be removed
- openspace: failes to build
- ruget: warnings during build
- synth: fails to build
- synth-git: fails to build
- python-gnureadline: Failed to build with poetry error
- python-tensorly: No such file or directory
- cwtch-bindings: fails sometimes
