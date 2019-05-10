#!/bin/bash
cd spacewalk
docker build . -t "compus.physik.uni-greifswald.de:5000/marc/spacewalk"
cd ../postgres
docker build . -t "compus.physik.uni-greifswald.de:5000/marc/spacewalkpostgres"
cd ..
