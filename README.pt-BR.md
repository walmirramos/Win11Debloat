# Win11Debloat — Português do Brasil

Esta versão usa português brasileiro por padrão na primeira execução. Para mudar o idioma, abra **Opções → Configurações → Idioma**. Preferências já salvas e o parâmetro `-Language` continuam tendo prioridade.

Projeto original: [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat). A documentação externa e as imagens do projeto original podem estar em inglês.

[![Versão mais recente no GitHub](https://img.shields.io/github/v/release/Raphire/Win11Debloat?style=for-the-badge&label=Última%20versão)](https://github.com/Raphire/Win11Debloat/releases/latest)
[![Participe da discussão](https://img.shields.io/badge/Participe-da%20discuss%C3%A3o-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat/discussions)
[![Documentação](https://img.shields.io/badge/Documenta%C3%A7%C3%A3o-Wiki-grey?style=for-the-badge&logo=bookstack)](https://github.com/Raphire/Win11Debloat/wiki/)

O Win11Debloat é um script simples e leve do PowerShell que permite organizar e personalizar sua experiência com o Windows, sem precisar instalar nada. Com ele, você pode remover aplicativos pré-instalados, desativar a telemetria, remover elementos indesejados da interface e muito mais. Você não precisa percorrer todas as configurações nem remover os aplicativos um por um: o Win11Debloat torna esse processo rápido e fácil!

O script também inclui recursos úteis para administradores de sistemas e usuários avançados, como uma interface de linha de comando completa, suporte ao Modo de Auditoria do Windows e a possibilidade de fazer alterações para outras contas do Windows. Você também pode exportar e importar suas configurações preferidas para aplicá-las facilmente em vários computadores. Consulte nossa [wiki](https://github.com/Raphire/Win11Debloat/wiki) para saber mais.

![Menu do Win11Debloat](/Assets/Images/menu.png)

#### Este script foi útil para você? Considere me pagar um café para apoiar meu trabalho

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/M4M5C6UPC)

## Uso

> [!WARNING]
> Este script foi desenvolvido com cuidado para evitar alterações indesejadas nas funções do sistema operacional, mas use-o por sua conta e risco. Se encontrar algum problema, relate-o [aqui](https://github.com/Raphire/Win11Debloat/issues).

### Método rápido

Baixe e execute o script automaticamente pelo PowerShell.

1. Abra o PowerShell ou o Terminal.
2. Copie e cole o comando abaixo no PowerShell:

```PowerShell
# Baixe esta versão em português brasileiro:
Invoke-WebRequest -Uri "https://github.com/walmirramos/Win11Debloat/archive/refs/heads/master.zip" -OutFile "$env:TEMP\Win11Debloat-pt-BR.zip"
Expand-Archive -LiteralPath "$env:TEMP\Win11Debloat-pt-BR.zip" -DestinationPath "$env:TEMP\Win11Debloat-pt-BR" -Force
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$env:TEMP\Win11Debloat-pt-BR\Win11Debloat-master\Win11Debloat.ps1" -Language pt-BR
```

3. Se o Windows solicitar, confirme a execução como administrador.
4. Na interface, selecione as alterações desejadas e confira o resumo antes de aplicar.

### Download manual

1. Clique em **Code → Download ZIP** neste repositório.
2. Extraia todos os arquivos do ZIP para uma pasta.
3. Execute `Run.bat` e confirme a solicitação de administrador.

### Linha de comando

No Windows PowerShell 5.1 aberto como administrador, acesse a pasta extraída e execute:

```powershell
.\Win11Debloat.ps1 -Language pt-BR -CLI
```

Nas confirmações em português, use `s` para sim e `n` para não. Os nomes dos parâmetros, identificadores de aplicativos e arquivos de configuração mantêm sua grafia original para preservar a compatibilidade.
