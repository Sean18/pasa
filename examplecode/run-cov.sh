# Start Fresh
rm -rf idir
rm -rf *.out

# Build & Analyze as normal
#
cov-build --dir idir g++ main.cpp -I ./boost_1_56_0
cov-analyze --dir idir --aggressiveness-level high 

COMMITOPTS="--host localhost --port 8082 --stream IncludeTest --user admin --password SIGpass8"

# First, commit ALL defects.
#
cov-commit-defects --dir idir $COMMITOPTS

# Next, remove defects, then run commit in single step.
#
commit-misra/bin/commit-misra \
	-d idir \
	-c removelist.config \
	-a -t \
	$COMMITOPTS	--description "Defects Removed"


#chmod +x commit-misra/bin/commit-misra
