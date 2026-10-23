[Início da documentação](README.md) · [Recursos](Recursos.md) · [Restaurar alterações](Restaurar-alteracoes.md)

# Importar e exportar configurações

## Exportar

1. Selecione os aplicativos, os ajustes e as opções de implantação desejados.
2. Abra **Opções → Exportar configuração**.
3. Marque as categorias que deseja incluir e exporte para um arquivo JSON.

Exportar salva a seleção; não aplica as alterações no computador.

## Importar

1. Abra **Opções → Importar configuração** e selecione o arquivo JSON.
2. Confira as categorias presentes no arquivo e marque as que deseja importar.
3. Confirme a importação e revise as alterações antes de aplicá-las.

Importar pela interface atualiza a seleção; não aplica as alterações imediatamente.

## Linha de comando

No Windows PowerShell 5.1, aberto como administrador na pasta do programa:

```powershell
.\Win11Debloat.ps1 -Language pt-BR -Config "C:\Configuracoes\Win11Debloat.json"
```

O comando importa a configuração para execução. Confira o resumo antes de confirmar. O parâmetro `-Silent` elimina confirmações e só deve ser usado quando você já revisou a configuração.

As últimas seleções também podem ser reutilizadas com `-RunSavedSettings` ou pela opção correspondente do menu `-CLI`, quando houver configurações salvas. A exportação de configurações é feita pela interface gráfica.
