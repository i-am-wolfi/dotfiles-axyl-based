#!/bin/bash

# Cria um array com os nomes dos temas disponíveis
themes=("tema1" "tema2" "tema3")

# Exibe uma lista numerada com os nomes dos temas
echo "Selecione um tema:"
for i in "${!themes[@]}"; do 
    echo "[$i] ${themes[$i]}"
done 

# Pede para o usuário selecionar um tema
read -p "Número do tema: " selection

# Verifica se o número selecionado é válido
if [[ "$selection" =~ ^[0-9]+$ && "$selection" -lt "${#themes[@]}" ]]; then
    # Entra na pasta do tema correspondente
    cd ~/.config/i3/themes/"${themes[$selection]}"/

    # Copia todos os arquivos da pasta do tema para a pasta do i3wm
    cp * ~/.config/i3/

    # Recarrega o i3wm para aplicar as mudanças
    i3-msg reload
else
    echo "Seleção inválida. Por favor, selecione novamente."
fi

