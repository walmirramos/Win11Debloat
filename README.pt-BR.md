# Win11Debloat

Versão em português brasileiro personalizada por **Dubbox** para organizar e ajustar o Windows 10 e o Windows 11.

[![Documentação](https://img.shields.io/badge/Documentação-Wiki-blue)](https://github.com/walmirramos/Win11Debloat/wiki)
[![Download](https://img.shields.io/badge/Download-Versão%20em%20português-green)](https://github.com/walmirramos/Win11Debloat/archive/refs/heads/traducao-pt-br.zip)

## Sobre o projeto

O Win11Debloat é um script PowerShell que permite remover aplicativos pré-instalados, ajustar opções de privacidade, desativar telemetria e personalizar elementos da interface do Windows.

Esta versão inclui interface e menus em pt-BR, documentação em português e links de ajuda para a Wiki deste repositório. A disponibilidade de cada ajuste depende da versão e edição do Windows.

![Interface do Win11Debloat em português brasileiro](https://raw.githubusercontent.com/walmirramos/Win11Debloat/traducao-pt-br/Assets/Images/menu.png)

## Como baixar e testar

A versão traduzida está na branch **traducao-pt-br** enquanto o [pull request #1](https://github.com/walmirramos/Win11Debloat/pull/1) aguarda integração à branch principal.

1. [Baixe o ZIP da versão em português](https://github.com/walmirramos/Win11Debloat/archive/refs/heads/traducao-pt-br.zip).
2. Extraia todo o conteúdo para uma nova pasta.
3. Execute **Run.bat**.
4. Confirme a solicitação de administrador.
5. Confira as opções e o resumo antes de aplicar qualquer alteração.

Abrir a interface não aplica os ajustes automaticamente. Se houver uma preferência de idioma salva, escolha português brasileiro em **Opções → Configurações → Idioma**.

## Documentação e dúvidas

Consulte a [Wiki em português](https://github.com/walmirramos/Win11Debloat/wiki):

- [Como usar](https://github.com/walmirramos/Win11Debloat/wiki/How-To-Use)
- [Recursos e ajustes do sistema](https://github.com/walmirramos/Win11Debloat/wiki/Features)
- [Remoção de aplicativos](https://github.com/walmirramos/Win11Debloat/wiki/App-Removal)
- [Restaurar alterações](https://github.com/walmirramos/Win11Debloat/wiki/Reverting-Changes)
- [Importar e exportar configurações](https://github.com/walmirramos/Win11Debloat/wiki/Importing-&-Exporting-Configuration)
- [Linha de comando](https://github.com/walmirramos/Win11Debloat/wiki/Command-line-Interface)

## Linha de comando

No **Windows PowerShell 5.1**, aberto como administrador na pasta extraída:

```powershell
.\Win11Debloat.ps1 -Language pt-BR -CLI
```

Nas confirmações traduzidas, use **s** para sim e **n** para não. Os nomes de parâmetros e identificadores técnicos mantêm a grafia original.

## Restauração

Revise os ajustes antes de aplicar. O backup do Registro pode recuperar configurações alteradas, mas não reinstala aplicativos removidos. Veja o [guia de restauração](https://github.com/walmirramos/Win11Debloat/wiki/Reverting-Changes).

## Autoria e licença

Personalização e versão em português: **Dubbox**.  
Projeto: [walmirramos/Win11Debloat](https://github.com/walmirramos/Win11Debloat).

Distribuído sob a [licença MIT](LICENSE), com os avisos de direitos autorais originais preservados.
