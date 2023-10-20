# Vim/Nvim
Colocar o cursor em um comando e apertar K gera a pagina do manual do comando



# Compressão GNUtar
## Comprime o arquivo de entrada, onde o -I permite especificar as flags do algoritmo de compressão
tar -I "zstd -T0 -19" -cfv $saida.tar.zst $entrada  

## Extrai o arquivo
tar -xfv $archive

## Verifica se houve corrompimento do arquivo
tar -tf $archive



# DNF
- O número de kernels instalada é gerenciada no arquivo
/etc/dnf/dnf.conf 

- Congelar a versão de um arquivo
sudo dnf versionlock $PACKAGE
- Remover congelamento
sudo dnf versionlock remove $PACKAGE



# Internet
## Senha + QRCode
nmcli device wifi show-password

## Info
ifconfig

## Portas
Permite saber o que cada porta de conexão faz _default_
/etc/services



# RISC-V
## OS
xv6
### Dependencias
- qemu-user-static permite a execução de programas em arquiteturas diferentes
binutils-riscv64-linux-gnu gcc-c++-riscv64-linux-gnu gcc-riscv64-linux-gnu qemu-user-static-riscv
