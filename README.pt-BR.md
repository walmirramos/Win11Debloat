# Win11Debloat

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
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
