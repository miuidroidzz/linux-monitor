#!/bin/bash

# Função para obter informações do sistema operacional
get_system_info() {
    echo "🖥️ Sistema Operacional:"
    echo "  OS: $(uname -s)"
    echo "  Versão: $(uname -r)"
    echo "  Arquitetura: $(uname -m)"
    echo
}

# Função para obter informações da CPU
get_cpu_info() {
    echo "🧠 CPU:"
    echo "  Uso da CPU (%): $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*//" | awk '{print 100 - $1}')"
    echo "  Núcleos lógicos: $(nproc)"
    echo
}

# Função para obter informações da RAM
get_ram_info() {
    echo "💾 Memória RAM:"
    free -h | grep -E "Mem:" | awk '{print "  Total: " $2 " | Usada: " $3 " | Livre: " $4}'
    echo
}

# Função para obter informações de armazenamento (ROM)
get_disk_info() {
    echo "📀 Armazenamento (ROM):"
    df -h --total | grep 'total' | awk '{print "  Total: " $2 " | Usado: " $3 " | Livre: " $4}'
    echo
}

# Função principal para atualizar e mostrar as informações
monitor() {
    while true; do
        clear
        get_system_info
        get_cpu_info
        get_ram_info
        get_disk_info
        sleep 5
    done
}

# Executar monitoramento
monitor
