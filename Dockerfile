FROM fedora
RUN yum update -y

RUN yum install -y  bzip2-devel cmake expat-devel file-devel glib2-devel libcurl-devel  libxml2-devel  python2-devel rpm-devel  openssl-devel  sqlite-devel xz-devel zlib-devel doxygen python-sphinx check-devel python-nose 
RUN yum install -y gcc findutils
CMD bash -c "cd /createrepo_c && rm -rf build && mkdir build && cd build && cmake .. && make &&  mkdir dist && find -L ./src/  -type f ! -name python ! -iwholename '*Make*' ! -name '_*' | xargs -l -I{} cp {} dist/ && echo 'Everything is ready in ./build/dist' && echo 'To build a docker image run docker build -t createrepo -f Dockerfile.createrepo .'"


