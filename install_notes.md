
 - Following instructions at: http://kaldi.sourceforge.net/tutorial_setup.html

 - first `cd` to `kaldi-trunk/tools` then do a `make -j 8` to build to tools kaldi uses
	- Issue: Requires Libtool
		- Resolution: Build and install libtool, I did so by installing from source: http://ftpmirror.gnu.org/libtool/libtool-2.4.5.tar.gz locally (via configure --prefix)
 - then try and build kaldi, first running .configure
	- Issue: Needs a BLAS.
		- Resolution: use OpenBlas
			- go back to kaldi-trunl/tools and `make openblas` 
			- use it by running `./configure  --openblas-root=../tools/OpenBLAS/install`
	- Issue: this Kaldi won&apos;t run with GCC 4.8.4
		- Resolution: install newer GCC. This is a terrifying thing to do.
			- Follow instructions at https://gcc.gnu.org/wiki/InstallingGCC
				- in particular for getting the dependancies
			- When it comes to running configure use: `../gcc-4.9.2/configure --prefix=$LOCAL_INSTALL --disable-multilib`
			- when doing use `make -j 8` or it will take a very long time to build

	