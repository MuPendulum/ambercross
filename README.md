<h1 align="center">
  <b>ambercross</b>
</h1>

ambercross builds and provides aggressively optimized emulators using a cross-compiler for use with [AmberELEC](https://github.com/AmberELEC/AmberELEC).

## Install cores

Download and extract `cores-yymmdd.zip` from the [Releases](https://github.com/MuPendulum/ambercross/releases) page.
<br>
Copy the contents of `cores/` to `/storage/cores/` on your SD card.

## Building

Included is a simple build script to automatically build all cores; it was created for my personal use and therefore is quite limited and messy. Patches for cores may be prone to breakage due to pulling the latest sources for cores.

### Step 1

Install packages which provide the following commands required by the build script:
<br>
`git bash rsync 7za`
<br>

Install required libraries for target:
<br>
`zlib`
<br>

### Step 2

Ensure you have a cross-compiler in your path and set the correct `TARGET` tuple in `scripts/variables.sh`.
<br>

Included in `crosstool-ng/` is a ct-ng config which you may use to build a compatible crosstool-ng toolchain.

### Step 3

Run the build script `./build.sh`.
<br>
Libraries will be copied to `release/` and an archive containing the libraries will be created at `cores-yymmdd.zip`
