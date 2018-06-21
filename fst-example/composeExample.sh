#!/bin/bash

# Based on http://www.isle.illinois.edu/sst/courses/minicourses/2009/lecture6.pdf

set -x

bash compileAndDraw.sh sent.fsa
bash compileAndDraw.sh dict.fst

fstcompose --fst_compat_symbols=false sent.fsa dict.fst > strings.fst
fstdraw --portrait  strings.fst | dot -Tsvg >  strings.svg
echo 'Done composing: outputted strings.svg'
echo 'Example sentences:'
echo '------------------'

for i in `seq 1 10`;
do
	fstrandgen --seed=$RANDOM strings.fst | fstproject --project_output |
	fstprint --acceptor --isymbols=dict.osyms |
	awk '{printf("%s ",$3)}END{printf("\n")}'
done

fstrandgen --seed=$RANDOM strings.fst | fstproject --project_output |
	fstprint --acceptor --isymbols=dict.osyms

