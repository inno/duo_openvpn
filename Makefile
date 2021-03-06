
all: duo_openvpn.so

duo_openvpn.o: duo_openvpn.c
	gcc -fPIC -c duo_openvpn.c

duo_openvpn.so: duo_openvpn.o
	gcc -fPIC -shared -Wl,-soname,duo_openvpn.so -o duo_openvpn.so duo_openvpn.o -lc	

install: duo_openvpn.so
	mkdir -p /opt/duo
	cp duo_openvpn.so /opt/duo
	cp duo_openvpn.py /opt/duo
	chmod 755 /opt/duo/duo_openvpn.so
	chmod 755 /opt/duo/duo_openvpn.py

uninstall:
	rm -rf /opt/duo

clean:
	rm -f *.so *.o
