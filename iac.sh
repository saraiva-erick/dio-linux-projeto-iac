#!/bin/bash

echo "Excluindo os diretórios"
rm -Rf /adm/
rm -Rf /publico/
rm -Rf /sec/
rm -Rf /ven/

echo "Excluindo os usuários"
userdel -r carlos
userdel -r maria
userdel -r joao
userdel -r debora
userdel -r sebastiana
userdel -r roberto
userdel -r josefina
userdel -r amanda
userdel -r rogerio

echo "Excluindo os grupos"
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Criando os diretórios
mkdir /adm
mkdir /publico
mkdir /sec
mkdir /ven

echo "Criando os grupos de usuários"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando os usuários e adicionando-os aos grupos"
useradd carlos -m -s /bin/bash -p $(openssl passwd password) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd password) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt password) -G GRP_SEC

echo "Atribuindo permissões aos diretórios"
chown root:GRP_ADM /adm
chown root:GRP_SEC /sec
chown root:GRP_VEN /ven

chmod 770 /adm
chmod 770 /sec
chmod 770 /ven
chmod 770 /publico

echo "Fim do processo!!!" 
