curl -o zabbix.tar.gz "${ZABBIX_ARCHIVE}"
mkdir -p "${HOME}/src"
tar --strip-components=1 -C "${HOME}/src" -xf zabbix.tar.gz
rm zabbix.tar.gz
cd "${HOME}/src"

./configure --enable-agent2 --with-libcurl --with-libxml2 --with-openssl
make
cp src/go/bin/zabbix_agent2 /publish
