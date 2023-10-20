# WIFI
- Wifi não funcionava em kernels após a 5.17 e antes da 6.1
- Era necessário desligar os serviços de localização (GPS)

Minha primeira solução foi usar o GRUB para usar a versão correta da kernel, no caso a 5.17
``` Bash
# index=0 => Kernel mais recente
# Index=1 => Segunda kernel do sistema
sudo grubby --set-default-index=entry-index
```

Para não ter conflitos, impedi que o sistema atualizasse a kernel usando este comando
``` Bash
sudo dnf versionlock <package_name>
```

Para voltar a atualizar o pacote, usei
``` Bash
sudo dnf versionlock delete <package_name>
```

# Não sei
Por algum motivo, eu estava tendo erros com o xdg-desktop-portal
Resolvi reinstalar
Resolveu meu problema de boot
_shrug_

# ####

Prefiro que o meu sistema utilize a memoria RAM com compressão (ZRAM) ao inves da RAM normal
Editei o arquivo
        /etc/sysctl.conf
E adicionei
      vm.swappiness = 150

# Map Count
- Fiz isso, valor original é 65530
``` Bash
sysctl -w vm.max_map_count=262144
```


# Wine
Wine deixa arquivos .directory em .local/share/applications/wine/Programs/ 
E arquivos .menu em .config/menus/applications-merged/wine-*


# CPU
- Coloquei um novo "controlador" (governor) de perfomance e estou rodando ele como daemon
  - auto-cpufreq
  - Pasta de configuração
    - /etc/auto-cpufreq.conf

Para ativá-lo (daemon), uso o comando:
``` Bash
sudo auto-cpufreq --install
```
Para destivá-lo (daemon), uso o comando:
``` Bash
sudo auto-cpufreq --remove
```
Os estados disponíveis para o processador são encontrados com o comando:
``` Bash
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
```