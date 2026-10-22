[Início da documentação](README.md) · [Recursos](Recursos.md) · [Restaurar alterações](Restaurar-alteracoes.md)

# Restaurar alterações

## Restaurar o backup do Registro

1. Abra o Win11Debloat como administrador.
2. Entre em **Opções → Restaurar backup** e escolha a restauração do Registro.
3. Selecione o arquivo de backup criado antes das alterações.
4. Confira o usuário de destino e o resumo; restaure somente o backup correspondente ao que deseja desfazer.
5. Reinicie o computador se solicitado e confira o resultado.

O backup do Registro restaura configurações; ele **não reinstala aplicativos removidos**. Se o backup foi desativado durante a aplicação, ele não estará disponível para aquela execução.

## Restaurar os aplicativos fixados no Menu Iniciar

Em **Opções → Restaurar backup**, escolha o backup do Menu Iniciar, selecione o usuário e use a busca automática ou selecione o arquivo manualmente. Confirme a restauração. Essa ação recupera a organização dos itens fixados, sem reinstalar aplicativos.

## Desfazer ajustes pela interface

Abra os ajustes do sistema e ative a opção de detectar os ajustes já aplicados. Revise e desmarque as opções que deseja desfazer quando o recurso permitir reversão; confira o resumo antes de aplicar. A página de [recursos](Recursos.md) informa os arquivos de reversão disponíveis em `Regfiles/Undo`.

## Reinstalar aplicativos

Use a Microsoft Store, o site oficial do aplicativo ou o WinGet. Alguns componentes exigem procedimentos adicionais; não presuma que qualquer aplicativo poderá ser reinstalado facilmente. A Microsoft Store e componentes de sistema merecem atenção especial antes da remoção.

### Pesquisa na Web do Bing

O arquivo [Enable_Bing_Cortana_In_Search.reg](../../Regfiles/Undo/Enable_Bing_Cortana_In_Search.reg) corresponde à reversão do ajuste. Em algumas regiões, também pode ser necessário reinstalar o aplicativo Web Search from Microsoft Bing pela Microsoft Store e habilitá-lo nas configurações da pesquisa.

### Widgets

A restauração pode exigir reinstalar os aplicativos Start Experiences App, Widgets Platform Runtime e Windows Web Experience Pack pela Microsoft Store. Restaurar apenas o Registro pode não ser suficiente.

### Microsoft Edge

As opções desativadas por políticas podem ser restauradas pelos ajustes correspondentes ou pelos arquivos [Enable_Edge_Ads_And_Suggestions.reg](../../Regfiles/Undo/Enable_Edge_Ads_And_Suggestions.reg) e [Enable_Edge_AI_Features.reg](../../Regfiles/Undo/Enable_Edge_AI_Features.reg). Feche e abra novamente o Edge após a restauração.

## Restauração do Sistema

Se houver um ponto de restauração anterior, a Restauração do Sistema do Windows pode ajudar a recuperar configurações. Ela pode remover aplicativos, drivers e atualizações instalados depois do ponto escolhido. Confira o que será afetado antes de confirmar.
