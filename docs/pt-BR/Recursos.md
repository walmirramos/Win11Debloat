# Recursos do Win11Debloat
[Início da documentação](README.md) · [Recursos](Recursos.md) · [Restaurar alterações](Restaurar-alteracoes.md)

Documentação em português brasileiro para a versão de Dubbox. As descrições abaixo usam o catálogo pt-BR e as configurações desta versão do projeto, a mesma base utilizada pela [página de recursos original](https://github.com/Raphire/Win11Debloat/wiki/Features). Os parâmetros e nomes de arquivos mantêm a grafia necessária para executar o programa.

## Índice

- [Remoção de aplicativos](#app-removal)
- [Privacidade e Conteúdo Sugerido](#privacy--suggested-content)
- [Sistema](#system)
- [Menu Iniciar e Pesquisa](#start-menu--search)
- [IA](#ai)
- [Atualização do Windows](#windows-update)
- [Barra de tarefas](#taskbar)
- [Aparência](#appearance)
- [Explorador de Arquivos](#file-explorer)
- [Jogos](#gaming)
- [Multi-tarefa](#multi-tasking)
- [Funcionalidades Opcionais do Windows](#optional-windows-features)
- [Outros](#other)

<a id="app-removal"></a>
## Remoção de aplicativos

Veja o [guia de remoção e a lista de aplicativos](Remocao-de-aplicativos.md). A restauração do Registro não reinstala aplicativos removidos.

<a id="privacy--suggested-content"></a>
## Privacidade e Conteúdo Sugerido

### Desabilitar telemetria, rastreamento e anúncios direcionados

Esta configuração desabilita telemetria, coleta de dados de diagnóstico, histórico de atividades, rastreamento de inicialização de apps, anúncios direcionados e mais. Limita os dados enviados à Microsoft sobre seu dispositivo e uso. Se você for um Windows Insider, as atualizações podem ser bloqueadas até que a coleta opcional de dados de diagnóstico seja reativada.

**Parâmetro:** `-DisableTelemetry`

- **Aplicar:** [Disable_Telemetry.reg](../../Regfiles/Disable_Telemetry.reg)
- **Desfazer:** [Enable_Telemetry.reg](../../Regfiles/Undo/Enable_Telemetry.reg)

**Opção de reversão:** Habilitar telemetria, rastreamento e anúncios direcionados.

### Desabilitar dicas, truques e conteúdo sugerido em todo o Windows

Esta configuração remove muitas distrações irritantes do Windows. Isso inclui coisas como notificações, lembretes e anúncios de provedor de sincronização. Também impede a instalação automática de apps sugeridos.

**Parâmetro:** `-DisableSuggestions`

- **Aplicar:** [Disable_Windows_Suggestions.reg](../../Regfiles/Disable_Windows_Suggestions.reg)
- **Desfazer:** [Enable_Windows_Suggestions.reg](../../Regfiles/Undo/Enable_Windows_Suggestions.reg)

**Opção de reversão:** Habilitar dicas, truques e conteúdo sugerido em todo o Windows.

### Desabilitar notificações do Windows (de apps e outros remetentes)

Desabilita notificações nativas do Windows de apps e outros remetentes, incluindo notificações de apps como Discord, WhatsApp, Teams e Slack.

**Parâmetro:** `-DisableNotifications`

- **Aplicar:** [Disable_Notifications.reg](../../Regfiles/Disable_Notifications.reg)
- **Desfazer:** [Enable_Notifications.reg](../../Regfiles/Undo/Enable_Notifications.reg)

**Opção de reversão:** Habilitar notificações e lembretes do Windows.

### Desabilitar serviços de localização do Windows e acesso à localização de apps

Isto desabilitará os serviços de localização do Windows e negará o acesso dos apps à sua localização. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableLocationServices`

- **Aplicar:** [Disable_Location_Services.reg](../../Regfiles/Disable_Location_Services.reg)
- **Desfazer:** [Enable_Location_Services.reg](../../Regfiles/Undo/Enable_Location_Services.reg)

**Opção de reversão:** Habilitar serviços de localização do Windows e acesso à localização de apps.

### Desabilitar rastreamento de localização do Encontrar Meu Dispositivo

Isto desabilitará a funcionalidade 'Encontrar Meu Dispositivo', que periodicamente envia a localização do seu dispositivo para a Microsoft. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableFindMyDevice`

- **Aplicar:** [Disable_Find_My_Device.reg](../../Regfiles/Disable_Find_My_Device.reg)
- **Desfazer:** [Enable_Find_My_Device.reg](../../Regfiles/Undo/Enable_Find_My_Device.reg)

**Opção de reversão:** Habilitar rastreamento de localização do Encontrar Meu Dispositivo.

### Desabilitar dicas e truques na tela de bloqueio

Isto desabilitará a opção de destaque da tela de bloqueio e desabilitará as dicas, truques e fatos divertidos que aparecem na tela de bloqueio.

**Parâmetro:** `-DisableLockscreenTips`

- **Aplicar:** [Disable_Lockscreen_Tips.reg](../../Regfiles/Disable_Lockscreen_Tips.reg)
- **Desfazer:** [Enable_Lockscreen_Tips.reg](../../Regfiles/Undo/Enable_Lockscreen_Tips.reg)

**Opção de reversão:** Habilitar dicas e truques na tela de bloqueio.

### Desabilitar anúncios, sugestões e feed de notícias no Edge

Isto desabilitará várias distrações do Microsoft Edge, como anúncios, sugestões e o feed de notícias MSN. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableEdgeAds`

- **Aplicar:** [Disable_Edge_Ads_And_Suggestions.reg](../../Regfiles/Disable_Edge_Ads_And_Suggestions.reg)
- **Desfazer:** [Enable_Edge_Ads_And_Suggestions.reg](../../Regfiles/Undo/Enable_Edge_Ads_And_Suggestions.reg)

**Opção de reversão:** Habilitar anúncios, sugestões e feed de notícias no Edge.

### Ocultar anúncios do Microsoft 365 Copilot na Página Inicial do Configurações

Isto desabilitará os anúncios do Microsoft 365 Copilot que aparecem na página inicial do Configurações.

**Parâmetro:** `-DisableSettings365Ads`

- **Aplicar:** [Disable_Settings_365_Ads.reg](../../Regfiles/Disable_Settings_365_Ads.reg)
- **Desfazer:** [Enable_Settings_365_Ads.reg](../../Regfiles/Undo/Enable_Settings_365_Ads.reg)

**Opção de reversão:** Mostrar anúncios do Microsoft 365 Copilot na Página Inicial do Configurações.

**Build mínima do Windows:** `22000`.

<a id="system"></a>
## Sistema

### Desabilitar 'Drag Tray' para compartilhar e mover arquivos

O Drag Tray é uma nova funcionalidade para compartilhar e mover arquivos no Windows 11, aparece no topo da tela ao arrastar arquivos.

**Parâmetro:** `-DisableDragTray`

- **Aplicar:** [Disable_Share_Drag_Tray.reg](../../Regfiles/Disable_Share_Drag_Tray.reg)
- **Desfazer:** [Enable_Share_Drag_Tray.reg](../../Regfiles/Undo/Enable_Share_Drag_Tray.reg)

**Opção de reversão:** Habilitar 'Drag Tray' para compartilhar e mover arquivos.

**Build mínima do Windows:** `26200`.

### Usar estilo clássico de menu de contexto do Windows 10

Isto restaurará o estilo clássico do menu de contexto do Windows 10, que normalmente fica oculto atrás da entrada 'Mostrar mais opções' no novo menu de contexto do Windows 11.

**Parâmetro:** `-RevertContextMenu`

- **Aplicar:** [Disable_Show_More_Options_Context_Menu.reg](../../Regfiles/Disable_Show_More_Options_Context_Menu.reg)
- **Desfazer:** [Enable_W11_Style_Context_Menu.reg](../../Regfiles/Undo/Enable_W11_Style_Context_Menu.reg)

**Opção de reversão:** Usar estilo de menu de contexto do Windows 11.

**Build mínima do Windows:** `22000`.

### Desabilitar Melhorar Precisão do Ponteiro (aceleração do mouse)

Isto desabilitará a aceleração do mouse que é habilitada por padrão no Windows. Isso torna o movimento do mouse mais consistente e previsível.

**Parâmetro:** `-DisableMouseAcceleration`

- **Aplicar:** [Disable_Enhance_Pointer_Precision.reg](../../Regfiles/Disable_Enhance_Pointer_Precision.reg)
- **Desfazer:** [Enable_Enhance_Pointer_Precision.reg](../../Regfiles/Undo/Enable_Enhance_Pointer_Precision.reg)

**Opção de reversão:** Habilitar Melhorar Precisão do Ponteiro (aceleração do mouse).

### Desabilitar atalho de teclado das Teclas de Aderência (5x shift)

Isto impedirá que o diálogo das Teclas de Aderência apareça quando você pressionar a tecla Shift 5 vezes seguidas.

**Parâmetro:** `-DisableStickyKeys`

- **Aplicar:** [Disable_Sticky_Keys_Shortcut.reg](../../Regfiles/Disable_Sticky_Keys_Shortcut.reg)
- **Desfazer:** [Enable_Sticky_Keys_Shortcut.reg](../../Regfiles/Undo/Enable_Sticky_Keys_Shortcut.reg)

**Opção de reversão:** Habilitar atalho de teclado das Teclas de Aderência (5x shift).

**Build mínima do Windows:** `26100`.

### Desabilitar limpeza automática de disco do Storage Sense

Isto desabilitará o Storage Sense, que automaticamente libera espaço em disco deletando arquivos temporários, esvaziando a lixeira e limpando arquivos na pasta de Downloads.

**Parâmetro:** `-DisableStorageSense`

- **Aplicar:** [Disable_Storage_Sense.reg](../../Regfiles/Disable_Storage_Sense.reg)
- **Desfazer:** [Enable_Storage_Sense.reg](../../Regfiles/Undo/Enable_Storage_Sense.reg)

**Opção de reversão:** Habilitar limpeza automática de disco do Storage Sense.

**Build mínima do Windows:** `22000`.

### Desabilitar inicialização rápida

A inicialização rápida ajuda seu PC a iniciar mais rapidamente após o desligamento, salvando uma imagem do sistema em disco. Desabilitar a inicialização rápida pode ajudar com certos problemas, mas pode resultar em tempos de inicialização um pouco mais longos.

**Parâmetro:** `-DisableFastStartup`

- **Aplicar:** [Disable_Fast_Startup.reg](../../Regfiles/Disable_Fast_Startup.reg)
- **Desfazer:** [Enable_Fast_Startup.reg](../../Regfiles/Undo/Enable_Fast_Startup.reg)

**Opção de reversão:** Habilitar inicialização rápida.

### Desabilitar criptografia automática de dispositivos do BitLocker

Para dispositivos que suportam, o Windows 11 habilita automaticamente a criptografia de dispositivos BitLocker. Desabilitar isso desligará a criptografia automática do dispositivo, mas você ainda pode habilitar manualmente a criptografia BitLocker se desejar. Unidades que já estão criptografadas com BitLocker permanecerão criptografadas quando esta configuração for aplicada.

**Parâmetro:** `-DisableBitlockerAutoEncryption`

- **Aplicar:** [Disable_Bitlocker_Auto_Encryption.reg](../../Regfiles/Disable_Bitlocker_Auto_Encryption.reg)
- **Desfazer:** [Enable_Bitlocker_Auto_Encryption.reg](../../Regfiles/Undo/Enable_Bitlocker_Auto_Encryption.reg)

**Opção de reversão:** Habilitar criptografia automática de dispositivos do BitLocker.

**Build mínima do Windows:** `22000`.

### Desabilitar conectividade de rede do Modern Standby

Por padrão, dispositivos que suportam Modern Standby mantêm conectividade de rede durante o modo de suspensão. Desabilitar a conectividade de rede durante o Modern Standby pode ajudar a economizar bateria.

**Parâmetro:** `-DisableModernStandbyNetworking`

- **Aplicar:** [Disable_Modern_Standby_Networking.reg](../../Regfiles/Disable_Modern_Standby_Networking.reg)
- **Desfazer:** [Enable_Modern_Standby_Networking.reg](../../Regfiles/Undo/Enable_Modern_Standby_Networking.reg)

**Opção de reversão:** Habilitar conectividade de rede do Modern Standby.

**Build mínima do Windows:** `22000`.

<a id="start-menu--search"></a>
## Menu Iniciar e Pesquisa

### Remover todos os apps fixados do Menu Iniciar para este usuário apenas

Remover todos os apps fixados do Menu Iniciar para este usuário apenas

**Parâmetro:** `-ClearStart`


Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22621`.

### Remover todos os apps fixados do Menu Iniciar para todos os usuários existentes e novos

Remover todos os apps fixados do Menu Iniciar para todos os usuários existentes e novos

**Parâmetro:** `-ClearStartAllUsers`


Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22621`.

### Ocultar seção de recomendações no Menu Iniciar

Isto ocultará a seção de recomendações no Menu Iniciar, que mostra apps adicionados recentemente, arquivos abertos recentemente e recomendações de apps. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableStartRecommended`

- **Aplicar:** [Disable_Start_Recommended.reg](../../Regfiles/Disable_Start_Recommended.reg)
- **Desfazer:** [Enable_Start_Recommended.reg](../../Regfiles/Undo/Enable_Start_Recommended.reg)

**Opção de reversão:** Mostrar seção de recomendações no Menu Iniciar.

**Build mínima do Windows:** `22621`.

### Ocultar seção 'Todos os Apps' no Menu Iniciar

Isto ocultará a seção 'Todos os Apps' no Menu Iniciar, que mostra todos os apps instalados. ATENÇÃO: Ocultar esta seção pode dificultar a localização de apps instalados no seu sistema. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableStartAllApps`

- **Aplicar:** [Disable_Start_All_Apps.reg](../../Regfiles/Disable_Start_All_Apps.reg)
- **Desfazer:** [Enable_Start_All_Apps.reg](../../Regfiles/Undo/Enable_Start_All_Apps.reg)

**Opção de reversão:** Mostrar seção 'Todos os Apps' no Menu Iniciar.

**Build mínima do Windows:** `26200`.

### Desabilitar integração do Phone Link no Menu Iniciar

Isto removerá a integração do Phone Link no Menu Iniciar quando você tiver um dispositivo móvel conectado ao seu PC.

**Parâmetro:** `-DisableStartPhoneLink`

- **Aplicar:** [Disable_Phone_Link_In_Start.reg](../../Regfiles/Disable_Phone_Link_In_Start.reg)
- **Desfazer:** [Enable_Phone_Link_In_Start.reg](../../Regfiles/Undo/Enable_Phone_Link_In_Start.reg)

**Opção de reversão:** Habilitar integração do Phone Link no Menu Iniciar.

**Build mínima do Windows:** `22621`.

### Desabilitar pesquisa web do Bing e integração do Copilot na pesquisa

Isto desabilitará os resultados da pesquisa web do Bing e a integração do Copilot na experiência de pesquisa do Windows. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableBing`

- **Aplicar:** [Disable_Bing_Cortana_In_Search.reg](../../Regfiles/Disable_Bing_Cortana_In_Search.reg)
- **Desfazer:** [Enable_Bing_Cortana_In_Search.reg](../../Regfiles/Undo/Enable_Bing_Cortana_In_Search.reg)

**Opção de reversão:** Habilitar pesquisa web do Bing e integração do Copilot na pesquisa.

### Desabilitar sugestões de apps da Microsoft Store na pesquisa

Isto desabilitará as sugestões de apps da Microsoft Store na pesquisa do Windows.

**Parâmetro:** `-DisableStoreSearchSuggestions`


**Opção de reversão:** Habilitar sugestões de apps da Microsoft Store na pesquisa.

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22621`.

### Mostrar Todos os Apps em visualização por categoria (Padrão)

Isto definirá a seção Todos os Apps no Menu Iniciar para mostrar apps agrupados por categoria.

**Parâmetro:** `-StartAllAppsCategory`

- **Aplicar:** [Start_AllApps_Category.reg](../../Regfiles/Start_AllApps_Category.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `26200`.

### Mostrar Todos os Apps em visualização em grade

Isto definirá a seção Todos os Apps no Menu Iniciar para mostrar apps em um layout de grade alfabética.

**Parâmetro:** `-StartAllAppsGrid`

- **Aplicar:** [Start_AllApps_Grid.reg](../../Regfiles/Start_AllApps_Grid.reg)
- **Desfazer:** [Start_AllApps_Category.reg](../../Regfiles/Start_AllApps_Category.reg)

**Opção de reversão:** Mostrar Todos os Apps em visualização por categoria.

**Build mínima do Windows:** `26200`.

### Mostrar Todos os Apps em visualização em lista

Isto definirá a seção Todos os Apps no Menu Iniciar para mostrar apps em um layout de lista alfabética.

**Parâmetro:** `-StartAllAppsList`

- **Aplicar:** [Start_AllApps_List.reg](../../Regfiles/Start_AllApps_List.reg)
- **Desfazer:** [Start_AllApps_Category.reg](../../Regfiles/Start_AllApps_Category.reg)

**Opção de reversão:** Mostrar Todos os Apps em visualização por categoria.

**Build mínima do Windows:** `26200`.

<a id="ai"></a>
## IA

### Desabilitar Microsoft Copilot

Isto desabilitará e desinstalará o Microsoft Copilot, o assistente de IA integrado do Windows.

**Parâmetro:** `-DisableCopilot`

- **Aplicar:** [Disable_Copilot.reg](../../Regfiles/Disable_Copilot.reg)
- **Desfazer:** [Enable_Copilot.reg](../../Regfiles/Undo/Enable_Copilot.reg)

**Opção de reversão:** Habilitar Microsoft Copilot.

**Build mínima do Windows:** `22621`.

### Desabilitar Windows Recall

Isto desabilitará o Windows Recall, uma funcionalidade de IA que fornece acesso rápido a arquivos, apps e atividades recentemente usados. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableRecall`

- **Aplicar:** [Disable_AI_Recall.reg](../../Regfiles/Disable_AI_Recall.reg)
- **Desfazer:** [Enable_AI_Recall.reg](../../Regfiles/Undo/Enable_AI_Recall.reg)

**Opção de reversão:** Habilitar Windows Recall.

**Build mínima do Windows:** `22621`.

### Desabilitar Click To Do, análise de IA de texto e imagem

Isto desabilitará o Click To Do, que fornece funcionalidades de análise de IA de texto e imagem no Windows. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableClickToDo`

- **Aplicar:** [Disable_Click_to_Do.reg](../../Regfiles/Disable_Click_to_Do.reg)
- **Desfazer:** [Enable_Click_to_Do.reg](../../Regfiles/Undo/Enable_Click_to_Do.reg)

**Opção de reversão:** Habilitar Click To Do, análise de IA de texto e imagem.

**Build mínima do Windows:** `22621`.

### Impedir que o serviço de IA inicie automaticamente

Isto definirá o serviço WSAIFabricSvc para inicialização manual, impedindo que o serviço inicie automaticamente com o Windows.

**Parâmetro:** `-DisableAISvcAutoStart`

- **Aplicar:** [Disable_AI_Service_Auto_Start.reg](../../Regfiles/Disable_AI_Service_Auto_Start.reg)
- **Desfazer:** [Enable_AI_Service_Auto_Start.reg](../../Regfiles/Undo/Enable_AI_Service_Auto_Start.reg)

**Opção de reversão:** Permitir que o serviço de IA inicie automaticamente.

**Build mínima do Windows:** `22621`.

### Desabilitar funcionalidades de IA no Microsoft Edge

Isto desabilitará funcionalidades de IA no Microsoft Edge, como a barra lateral com IA e funcionalidades do Copilot. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableEdgeAI`

- **Aplicar:** [Disable_Edge_AI_Features.reg](../../Regfiles/Disable_Edge_AI_Features.reg)
- **Desfazer:** [Enable_Edge_AI_Features.reg](../../Regfiles/Undo/Enable_Edge_AI_Features.reg)

**Opção de reversão:** Habilitar funcionalidades de IA no Microsoft Edge.

**Build mínima do Windows:** `22621`.

### Desabilitar funcionalidades de IA no Google Chrome

Desabilita as ferramentas e integrações de IA incorporadas ao Google Chrome, incluindo Gemini, pesquisa e sugestões com IA, assistência à escrita, preenchimento automático e muito mais. Também remove os modelos locais de IA. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableChromeAI`

- **Aplicar:** [Disable_Chrome_AI_Features.reg](../../Regfiles/Disable_Chrome_AI_Features.reg)
- **Desfazer:** [Enable_Chrome_AI_Features.reg](../../Regfiles/Undo/Enable_Chrome_AI_Features.reg)

**Opção de reversão:** Habilitar funcionalidades de IA no Google Chrome.

**Build mínima do Windows:** `22621`.

### Desabilitar funcionalidades de IA no Paint

Isto desabilitará funcionalidades de IA no Paint, como a geração e edição de imagens com IA. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisablePaintAI`

- **Aplicar:** [Disable_Paint_AI_Features.reg](../../Regfiles/Disable_Paint_AI_Features.reg)
- **Desfazer:** [Enable_Paint_AI_Features.reg](../../Regfiles/Undo/Enable_Paint_AI_Features.reg)

**Opção de reversão:** Habilitar funcionalidades de IA no Paint.

**Build mínima do Windows:** `22621`.

### Desabilitar funcionalidades de IA no Notepad

Isto desabilitará funcionalidades de IA no Notepad, como as sugestões de escrita com IA. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableNotepadAI`

- **Aplicar:** [Disable_Notepad_AI_Features.reg](../../Regfiles/Disable_Notepad_AI_Features.reg)
- **Desfazer:** [Enable_Notepad_AI_Features.reg](../../Regfiles/Undo/Enable_Notepad_AI_Features.reg)

**Opção de reversão:** Habilitar funcionalidades de IA no Notepad.

**Build mínima do Windows:** `22621`.

<a id="windows-update"></a>
## Atualização do Windows

### Impedir que receba atualizações assim que estiverem disponíveis

Isto impedirá que seu PC esteja entre os primeiros a receber novas atualizações que não sejam de segurança. Seu PC ainda receberá essas atualizações eventualmente.

**Parâmetro:** `-DisableUpdateASAP`

- **Aplicar:** [Disable_Update_ASAP.reg](../../Regfiles/Disable_Update_ASAP.reg)
- **Desfazer:** [Enable_Update_ASAP.reg](../../Regfiles/Undo/Enable_Update_ASAP.reg)

**Opção de reversão:** Permitir receber atualizações assim que estiverem disponíveis.

### Impedir reinicializações automáticas após atualizações enquanto conectado

Isto impedirá que seu PC reinicie automaticamente após atualizações enquanto qualquer usuário estiver conectado.

**Parâmetro:** `-PreventUpdateAutoReboot`

- **Aplicar:** [Prevent_Auto_Reboot.reg](../../Regfiles/Prevent_Auto_Reboot.reg)
- **Desfazer:** [Allow_Auto_Reboot.reg](../../Regfiles/Undo/Allow_Auto_Reboot.reg)

**Opção de reversão:** Permitir reinicializações automáticas após atualizações enquanto conectado.

### Desabilitar compartilhamento de atualizações baixadas com outros PCs

Isto impedirá que seu PC compartilhe atualizações baixadas com outros PCs na rede local ou na internet. Isso também impede que seu PC baixe atualizações de outros PCs.

**Parâmetro:** `-DisableDeliveryOptimization`

- **Aplicar:** [Disable_Delivery_Optimization.reg](../../Regfiles/Disable_Delivery_Optimization.reg)
- **Desfazer:** [Enable_Delivery_Optimization.reg](../../Regfiles/Undo/Enable_Delivery_Optimization.reg)

**Opção de reversão:** Habilitar compartilhamento de atualizações baixadas com outros PCs.

### Impedir que o Windows instale automaticamente apps complementares de dispositivos

Impede que o Windows instale silenciosamente apps complementares de dispositivos via Windows Update quando você conectar certos dispositivos, como monitores da LG e Alienware. Esses dispositivos ainda funcionarão normalmente, isso apenas impede que o Windows Update instale automaticamente apps adicionais sem consentimento.

**Parâmetro:** `-DisableDeviceAutoAppDownload`

- **Aplicar:** [Disable_Device_Auto_App_Download.reg](../../Regfiles/Disable_Device_Auto_App_Download.reg)
- **Desfazer:** [Enable_Device_Auto_App_Download.reg](../../Regfiles/Undo/Enable_Device_Auto_App_Download.reg)

**Opção de reversão:** Permitir instalação automática de apps complementares de dispositivos.

<a id="taskbar"></a>
## Barra de tarefas

### Alinhar a barra de tarefas à esquerda

Por padrão, o Windows 11 tem os botões da barra de tarefas centralizados. Habilitar esta configuração moverá os botões da barra de tarefas para a esquerda, semelhante a versões anteriores do Windows.

**Parâmetro:** `-TaskbarAlignLeft`

- **Aplicar:** [Align_Taskbar_Left.reg](../../Regfiles/Align_Taskbar_Left.reg)
- **Desfazer:** [Align_Taskbar_Center.reg](../../Regfiles/Undo/Align_Taskbar_Center.reg)

**Opção de reversão:** Alinhar a barra de tarefas ao centro.

**Build mínima do Windows:** `22000`.

### Ocultar ícone de pesquisa da barra de tarefas

Ocultar ícone de pesquisa da barra de tarefas

**Parâmetro:** `-HideSearchTb`

- **Aplicar:** [Hide_Search_Taskbar.reg](../../Regfiles/Hide_Search_Taskbar.reg)
- **Desfazer:** [Show_Search_Box.reg](../../Regfiles/Show_Search_Box.reg)

**Opção de reversão:** Mostrar caixa de pesquisa na barra de tarefas.

**Build mínima do Windows:** `22000`.

### Mostrar ícone de pesquisa na barra de tarefas

Mostrar ícone de pesquisa na barra de tarefas

**Parâmetro:** `-ShowSearchIconTb`

- **Aplicar:** [Show_Search_Icon.reg](../../Regfiles/Show_Search_Icon.reg)
- **Desfazer:** [Show_Search_Box.reg](../../Regfiles/Show_Search_Box.reg)

**Opção de reversão:** Mostrar caixa de pesquisa na barra de tarefas.

**Build mínima do Windows:** `22000`.

### Mostrar ícone de pesquisa com rótulo na barra de tarefas

Mostrar ícone de pesquisa com rótulo na barra de tarefas

**Parâmetro:** `-ShowSearchLabelTb`

- **Aplicar:** [Show_Search_Icon_And_Label.reg](../../Regfiles/Show_Search_Icon_And_Label.reg)
- **Desfazer:** [Show_Search_Box.reg](../../Regfiles/Show_Search_Box.reg)

**Opção de reversão:** Mostrar caixa de pesquisa na barra de tarefas.

**Build mínima do Windows:** `22000`.

### Mostrar caixa de pesquisa na barra de tarefas

Mostrar caixa de pesquisa na barra de tarefas

**Parâmetro:** `-ShowSearchBoxTb`

- **Aplicar:** [Show_Search_Box.reg](../../Regfiles/Show_Search_Box.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Ocultar botão 'Visualização de tarefas' na barra de tarefas

Isto desabilitará o botão 'Visualização de tarefas' na barra de tarefas, que permite ver todas as suas janelas abertas e áreas de trabalho virtuais.

**Parâmetro:** `-HideTaskview`

- **Aplicar:** [Hide_Taskview_Taskbar.reg](../../Regfiles/Hide_Taskview_Taskbar.reg)
- **Desfazer:** [Show_Taskview_Taskbar.reg](../../Regfiles/Undo/Show_Taskview_Taskbar.reg)

**Opção de reversão:** Mostrar botão 'Visualização de tarefas' na barra de tarefas.

**Build mínima do Windows:** `22000`.

### Desabilitar widgets na barra de tarefas e tela de bloqueio

Isto desabilitará as funcionalidades de widgets no Windows, incluindo o botão de widgets na barra de tarefas e os widgets que podem aparecer na tela de bloqueio.

**Parâmetro:** `-DisableWidgets`


Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

### Ocultar ícone do Chat (meet now) na barra de tarefas

Isto desabilitará o ícone do Chat (meet now) na barra de tarefas.

**Parâmetro:** `-HideChat`

- **Aplicar:** [Disable_Chat_Taskbar.reg](../../Regfiles/Disable_Chat_Taskbar.reg)
- **Desfazer:** [Enable_Chat_Taskbar.reg](../../Regfiles/Undo/Enable_Chat_Taskbar.reg)

**Opção de reversão:** Mostrar ícone do Chat (meet now) na barra de tarefas.

**Build máxima do Windows:** `22621`.

### Mostrar opção 'Finalizar tarefa' no menu de contexto da barra de tarefas

Quando habilitado, adiciona uma opção 'Finalizar tarefa' ao menu de contexto de clique direito para apps na barra de tarefas, permitindo que você feche apps forçadamente rapidamente.

**Parâmetro:** `-EnableEndTask`

- **Aplicar:** [Enable_End_Task.reg](../../Regfiles/Enable_End_Task.reg)
- **Desfazer:** [Disable_End_Task.reg](../../Regfiles/Undo/Disable_End_Task.reg)

**Opção de reversão:** Ocultar opção 'Finalizar tarefa' no menu de contexto da barra de tarefas.

**Build mínima do Windows:** `22631`.

### Habilitar comportamento 'Último clique ativo' para apps da barra de tarefas

Quando habilitado, clicar em um app na barra de tarefas mudará para a última janela ativa desse app, em vez de mostrar apenas a visualização em miniatura.

**Parâmetro:** `-EnableLastActiveClick`

- **Aplicar:** [Enable_Last_Active_Click.reg](../../Regfiles/Enable_Last_Active_Click.reg)
- **Desfazer:** [Disable_Last_Active_Click.reg](../../Regfiles/Undo/Disable_Last_Active_Click.reg)

**Opção de reversão:** Desabilitar comportamento 'Último clique ativo' para apps da barra de tarefas.

**Build mínima do Windows:** `22000`.

### Sempre combinar botões da barra de tarefas e ocultar rótulos na tela principal

Sempre combinar botões da barra de tarefas e ocultar rótulos na tela principal

**Parâmetro:** `-CombineTaskbarAlways`

- **Aplicar:** [Combine_Taskbar_Always.reg](../../Regfiles/Combine_Taskbar_Always.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Sempre combinar botões da barra de tarefas e ocultar rótulos em telas secundárias

Sempre combinar botões da barra de tarefas e ocultar rótulos em telas secundárias

**Parâmetro:** `-CombineMMTaskbarAlways`

- **Aplicar:** [Combine_MMTaskbar_Always.reg](../../Regfiles/Combine_MMTaskbar_Always.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Combinar botões da barra de tarefas e ocultar rótulos quando a barra estiver cheia na tela principal

Combinar botões da barra de tarefas e ocultar rótulos quando a barra estiver cheia na tela principal

**Parâmetro:** `-CombineTaskbarWhenFull`

- **Aplicar:** [Combine_Taskbar_When_Full.reg](../../Regfiles/Combine_Taskbar_When_Full.reg)
- **Desfazer:** [Combine_Taskbar_Always.reg](../../Regfiles/Combine_Taskbar_Always.reg)

**Opção de reversão:** Sempre combinar botões da barra de tarefas e ocultar rótulos na tela principal.

**Build mínima do Windows:** `22000`.

### Combinar botões da barra de tarefas e ocultar rótulos quando a barra estiver cheia em telas secundárias

Combinar botões da barra de tarefas e ocultar rótulos quando a barra estiver cheia em telas secundárias

**Parâmetro:** `-CombineMMTaskbarWhenFull`

- **Aplicar:** [Combine_MMTaskbar_When_Full.reg](../../Regfiles/Combine_MMTaskbar_When_Full.reg)
- **Desfazer:** [Combine_MMTaskbar_Always.reg](../../Regfiles/Combine_MMTaskbar_Always.reg)

**Opção de reversão:** Sempre combinar botões da barra de tarefas e ocultar rótulos em telas secundárias.

**Build mínima do Windows:** `22000`.

### Nunca combinar botões da barra de tarefas e mostrar rótulos na tela principal

Nunca combinar botões da barra de tarefas e mostrar rótulos na tela principal

**Parâmetro:** `-CombineTaskbarNever`

- **Aplicar:** [Combine_Taskbar_Never.reg](../../Regfiles/Combine_Taskbar_Never.reg)
- **Desfazer:** [Combine_Taskbar_Always.reg](../../Regfiles/Combine_Taskbar_Always.reg)

**Opção de reversão:** Sempre combinar botões da barra de tarefas e ocultar rótulos na tela principal.

**Build mínima do Windows:** `22000`.

### Nunca combinar botões da barra de tarefas e mostrar rótulos em telas secundárias

Nunca combinar botões da barra de tarefas e mostrar rótulos em telas secundárias

**Parâmetro:** `-CombineMMTaskbarNever`

- **Aplicar:** [Combine_MMTaskbar_Never.reg](../../Regfiles/Combine_MMTaskbar_Never.reg)
- **Desfazer:** [Combine_MMTaskbar_Always.reg](../../Regfiles/Combine_MMTaskbar_Always.reg)

**Opção de reversão:** Sempre combinar botões da barra de tarefas e ocultar rótulos em telas secundárias.

**Build mínima do Windows:** `22000`.

### Mostrar ícones de apps em todas as barras de tarefas

Mostrar ícones de apps em todas as barras de tarefas

**Parâmetro:** `-MMTaskbarModeAll`

- **Aplicar:** [MMTaskbarMode_All.reg](../../Regfiles/MMTaskbarMode_All.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Mostrar ícones de apps na barra principal e na barra onde a janela está aberta

Mostrar ícones de apps na barra principal e na barra onde a janela está aberta

**Parâmetro:** `-MMTaskbarModeMainActive`

- **Aplicar:** [MMTaskbarMode_Main_Active.reg](../../Regfiles/MMTaskbarMode_Main_Active.reg)
- **Desfazer:** [MMTaskbarMode_All.reg](../../Regfiles/MMTaskbarMode_All.reg)

**Opção de reversão:** Mostrar ícones de apps em todas as barras de tarefas.

**Build mínima do Windows:** `22000`.

### Mostrar ícones de apps apenas na barra de tarefas onde a janela está aberta

Mostrar ícones de apps apenas na barra de tarefas onde a janela está aberta

**Parâmetro:** `-MMTaskbarModeActive`

- **Aplicar:** [MMTaskbarMode_Active.reg](../../Regfiles/MMTaskbarMode_Active.reg)
- **Desfazer:** [MMTaskbarMode_All.reg](../../Regfiles/MMTaskbarMode_All.reg)

**Opção de reversão:** Mostrar ícones de apps em todas as barras de tarefas.

**Build mínima do Windows:** `22000`.

<a id="appearance"></a>
## Aparência

### Habilitar papel de parede e atalho do destaque do Windows na área de trabalho

Restaura o papel de parede do destaque do Windows e o atalho 'Saiba mais sobre esta imagem'.

**Parâmetro:** `-EnableDesktopSpotlight`

- **Aplicar:** [Enable_Desktop_Spotlight.reg](../../Regfiles/Enable_Desktop_Spotlight.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

### Desabilitar papel de parede do destaque do Windows na área de trabalho

Desabilita o destaque do Windows para o papel de parede da área de trabalho, que exibe imagens rotativas e pode mostrar dicas e fatos divertidos. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableDesktopSpotlight`

- **Aplicar:** [Disable_Desktop_Spotlight.reg](../../Regfiles/Disable_Desktop_Spotlight.reg)
- **Desfazer:** [Enable_Desktop_Spotlight.reg](../../Regfiles/Undo/Enable_Desktop_Spotlight.reg)

**Opção de reversão:** Habilitar papel de parede do destaque do Windows na área de trabalho.

### Ocultar o atalho de área de trabalho 'Saiba mais sobre esta imagem'

Oculta o atalho de área de trabalho 'Saiba mais sobre esta imagem' enquanto mantém a rotação de papel de parede do destaque do Windows habilitada. Não desabilita o destaque do Windows.

**Parâmetro:** `-HideDesktopSpotlightIcon`

- **Aplicar:** [Hide_Desktop_Spotlight_Icon.reg](../../Regfiles/Hide_Desktop_Spotlight_Icon.reg)
- **Desfazer:** [Show_Desktop_Spotlight_Icon.reg](../../Regfiles/Undo/Show_Desktop_Spotlight_Icon.reg)

**Opção de reversão:** Mostrar o atalho de área de trabalho 'Saiba mais sobre esta imagem'.

### Habilitar tema escuro para o sistema e apps

Isto definirá o tema do app e do sistema para o modo escuro.

**Parâmetro:** `-EnableDarkMode`

- **Aplicar:** [Enable_Dark_Mode.reg](../../Regfiles/Enable_Dark_Mode.reg)
- **Desfazer:** [Enable_Light_Mode.reg](../../Regfiles/Undo/Enable_Light_Mode.reg)

**Opção de reversão:** Desabilitar tema escuro para o sistema e apps.

### Desabilitar efeitos de transparência

Isto desabilitará os efeitos de transparência no Windows e nas interfaces. Isso pode ajudar a melhorar o desempenho em hardware mais antigo.

**Parâmetro:** `-DisableTransparency`

- **Aplicar:** [Disable_Transparency.reg](../../Regfiles/Disable_Transparency.reg)
- **Desfazer:** [Enable_Transparency.reg](../../Regfiles/Undo/Enable_Transparency.reg)

**Opção de reversão:** Habilitar efeitos de transparência.

### Desabilitar animações e efeitos visuais

Isto desabilitará animações e alguns efeitos visuais no Windows, o que pode fazer a interface parecer mais responsiva, especialmente em hardware mais antigo.

**Parâmetro:** `-DisableAnimations`

- **Aplicar:** [Disable_Animations.reg](../../Regfiles/Disable_Animations.reg)
- **Desfazer:** [Enable_Animations.reg](../../Regfiles/Undo/Enable_Animations.reg)

**Opção de reversão:** Habilitar animações e efeitos visuais.

<a id="file-explorer"></a>
## Explorador de Arquivos

### Alterar a localização padrão que o Explorador de Arquivos abre para 'Inicial'

Alterar a localização padrão que o Explorador de Arquivos abre para 'Inicial'

**Parâmetro:** `-ExplorerToHome`

- **Aplicar:** [Launch_File_Explorer_To_Home.reg](../../Regfiles/Launch_File_Explorer_To_Home.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

### Alterar a localização padrão que o Explorador de Arquivos abre para 'Este Computador'

Alterar a localização padrão que o Explorador de Arquivos abre para 'Este Computador'

**Parâmetro:** `-ExplorerToThisPC`

- **Aplicar:** [Launch_File_Explorer_To_This_PC.reg](../../Regfiles/Launch_File_Explorer_To_This_PC.reg)
- **Desfazer:** [Launch_File_Explorer_To_Home.reg](../../Regfiles/Launch_File_Explorer_To_Home.reg)

**Opção de reversão:** Alterar a localização padrão que o Explorador de Arquivos abre para 'Inicial'.

### Alterar a localização padrão que o Explorador de Arquivos abre para 'Downloads'

Alterar a localização padrão que o Explorador de Arquivos abre para 'Downloads'

**Parâmetro:** `-ExplorerToDownloads`

- **Aplicar:** [Launch_File_Explorer_To_Downloads.reg](../../Regfiles/Launch_File_Explorer_To_Downloads.reg)
- **Desfazer:** [Launch_File_Explorer_To_Home.reg](../../Regfiles/Launch_File_Explorer_To_Home.reg)

**Opção de reversão:** Alterar a localização padrão que o Explorador de Arquivos abre para 'Inicial'.

### Alterar a localização padrão que o Explorador de Arquivos abre para 'OneDrive'

Alterar a localização padrão que o Explorador de Arquivos abre para 'OneDrive'

**Parâmetro:** `-ExplorerToOneDrive`

- **Aplicar:** [Launch_File_Explorer_To_OneDrive.reg](../../Regfiles/Launch_File_Explorer_To_OneDrive.reg)
- **Desfazer:** [Launch_File_Explorer_To_Home.reg](../../Regfiles/Launch_File_Explorer_To_Home.reg)

**Opção de reversão:** Alterar a localização padrão que o Explorador de Arquivos abre para 'Inicial'.

### Mostrar extensões de arquivo para tipos de arquivo conhecidos

Isto mostrará extensões de arquivo para tipos de arquivo conhecidos. Por padrão, o Windows oculta extensões de arquivo para tipos de arquivo conhecidos, o que pode levar a confusão e riscos de segurança.

**Parâmetro:** `-ShowKnownFileExt`

- **Aplicar:** [Show_Extensions_For_Known_File_Types.reg](../../Regfiles/Show_Extensions_For_Known_File_Types.reg)
- **Desfazer:** [Hide_Extensions_For_Known_File_Types.reg](../../Regfiles/Undo/Hide_Extensions_For_Known_File_Types.reg)

**Opção de reversão:** Ocultar extensões de arquivo para tipos de arquivo conhecidos.

### Mostrar arquivos, pastas e unidades ocultos

Por padrão, o Windows oculta certos arquivos, pastas e unidades para evitar modificação ou exclusão acidental. Habilite isso para mostrar todos os arquivos no Explorador de Arquivos.

**Parâmetro:** `-ShowHiddenFolders`

- **Aplicar:** [Show_Hidden_Folders.reg](../../Regfiles/Show_Hidden_Folders.reg)
- **Desfazer:** [Hide_Hidden_Folders.reg](../../Regfiles/Undo/Hide_Hidden_Folders.reg)

**Opção de reversão:** Ocultar arquivos, pastas e unidades ocultos.

### Ocultar entradas duplicadas de unidades removíveis

Por padrão, o Windows mostra unidades removíveis tanto em 'Este Computador' quanto no painel de navegação com sua própria entrada. Habilite esta configuração para mostrar unidades removíveis apenas em 'Este Computador'.

**Parâmetro:** `-HideDupliDrive`

- **Aplicar:** [Hide_duplicate_removable_drives_from_navigation_pane_of_File_Explorer.reg](../../Regfiles/Hide_duplicate_removable_drives_from_navigation_pane_of_File_Explorer.reg)
- **Desfazer:** [Show_duplicate_removable_drives_in_navigation_pane_of_File_Explorer.reg](../../Regfiles/Undo/Show_duplicate_removable_drives_in_navigation_pane_of_File_Explorer.reg)

**Opção de reversão:** Mostrar entradas duplicadas de unidades removíveis.

### Ocultar 'Inicial' do painel de navegação

Oculta a seção 'Inicial' do painel de navegação do Explorador de Arquivos. Aviso: os atalhos do Acesso rápido podem não ser atualizados até você reiniciar o PC ou o Explorador de Arquivos.

**Parâmetro:** `-HideHome`

- **Aplicar:** [Hide_Home_from_Explorer.reg](../../Regfiles/Hide_Home_from_Explorer.reg)
- **Desfazer:** [Show_Home_in_Explorer.reg](../../Regfiles/Undo/Show_Home_in_Explorer.reg)

**Opção de reversão:** Mostrar 'Inicial' do painel de navegação.

**Build mínima do Windows:** `22000`.

### Ocultar 'Galeria' do painel de navegação

Oculta a seção 'Galeria' do painel de navegação do Explorador de Arquivos.

**Parâmetro:** `-HideGallery`

- **Aplicar:** [Hide_Gallery_from_Explorer.reg](../../Regfiles/Hide_Gallery_from_Explorer.reg)
- **Desfazer:** [Show_Gallery_in_Explorer.reg](../../Regfiles/Undo/Show_Gallery_in_Explorer.reg)

**Opção de reversão:** Mostrar 'Galeria' do painel de navegação.

**Build mínima do Windows:** `22000`.

### Ocultar 'OneDrive' do painel de navegação

Oculta a seção 'OneDrive' do painel de navegação do Explorador de Arquivos.

**Parâmetro:** `-HideOnedrive`

- **Aplicar:** [Hide_Onedrive_Folder.reg](../../Regfiles/Hide_Onedrive_Folder.reg)
- **Desfazer:** [Show_Onedrive_Folder.reg](../../Regfiles/Undo/Show_Onedrive_Folder.reg)

**Opção de reversão:** Mostrar 'OneDrive' do painel de navegação.

### Ocultar pasta 'Objetos 3D' em 'Este Computador'

Oculta a pasta 'Objetos 3D' do painel de navegação do Explorador de Arquivos.

**Parâmetro:** `-Hide3dObjects`

- **Aplicar:** [Hide_3D_Objects_Folder.reg](../../Regfiles/Hide_3D_Objects_Folder.reg)
- **Desfazer:** [Show_3D_Objects_Folder.reg](../../Regfiles/Undo/Show_3D_Objects_Folder.reg)

**Opção de reversão:** Mostrar pasta 'Objetos 3D' em 'Este Computador'.

**Build máxima do Windows:** `21999`.

### Ocultar pasta 'Músicas' em 'Este Computador'

Oculta a pasta 'Músicas' do painel de navegação do Explorador de Arquivos.

**Parâmetro:** `-HideMusic`

- **Aplicar:** [Hide_Music_Folder.reg](../../Regfiles/Hide_Music_Folder.reg)
- **Desfazer:** [Show_Music_Folder.reg](../../Regfiles/Undo/Show_Music_Folder.reg)

**Opção de reversão:** Mostrar pasta 'Músicas' em 'Este Computador'.

**Build máxima do Windows:** `21999`.

### Adicionar pastas comuns de volta à página 'Este Computador'

Esta configuração adicionará pastas comuns como Área de Trabalho, Documentos, Downloads, Músicas, Imagens e Vídeos de volta à página 'Este Computador' no Explorador de Arquivos.

**Parâmetro:** `-AddFoldersToThisPC`

- **Aplicar:** [Add_All_Folders_Under_This_PC.reg](../../Regfiles/Add_All_Folders_Under_This_PC.reg)
- **Desfazer:** [Remove_All_Folders_Under_This_PC.reg](../../Regfiles/Undo/Remove_All_Folders_Under_This_PC.reg)

**Opção de reversão:** Remover pastas comuns da página 'Este Computador'.

**Build mínima do Windows:** `22000`.

### Ocultar opção 'Incluir na biblioteca' no menu de contexto

Oculta a opção 'Incluir na biblioteca' do menu de contexto do Explorador de Arquivos.

**Parâmetro:** `-HideIncludeInLibrary`

- **Aplicar:** [Disable_Include_in_library_from_context_menu.reg](../../Regfiles/Disable_Include_in_library_from_context_menu.reg)
- **Desfazer:** [Enable_Include_in_library_in_context_menu.reg](../../Regfiles/Undo/Enable_Include_in_library_in_context_menu.reg)

**Opção de reversão:** Mostrar opção 'Incluir na biblioteca' no menu de contexto.

**Build máxima do Windows:** `21999`.

### Ocultar opção 'Dar acesso a' no menu de contexto

Oculta a opção 'Dar acesso a' do menu de contexto do Explorador de Arquivos.

**Parâmetro:** `-HideGiveAccessTo`

- **Aplicar:** [Disable_Give_access_to_context_menu.reg](../../Regfiles/Disable_Give_access_to_context_menu.reg)
- **Desfazer:** [Enable_Give_access_to_context_menu.reg](../../Regfiles/Undo/Enable_Give_access_to_context_menu.reg)

**Opção de reversão:** Mostrar opção 'Dar acesso a' no menu de contexto.

**Build máxima do Windows:** `21999`.

### Ocultar opção 'Compartilhar' no menu de contexto

Oculta a opção 'Compartilhar' do menu de contexto do Explorador de Arquivos.

**Parâmetro:** `-HideShare`

- **Aplicar:** [Disable_Share_from_context_menu.reg](../../Regfiles/Disable_Share_from_context_menu.reg)
- **Desfazer:** [Enable_Share_in_context_menu.reg](../../Regfiles/Undo/Enable_Share_in_context_menu.reg)

**Opção de reversão:** Mostrar opção 'Compartilhar' no menu de contexto.

**Build máxima do Windows:** `21999`.

### Mostrar letras de unidade antes da etiqueta da unidade

Esta configuração mostrará as letras de unidade antes da etiqueta da unidade no Explorador de Arquivos.

**Parâmetro:** `-ShowDriveLettersFirst`

- **Aplicar:** [Show_Drive_Letters_First.reg](../../Regfiles/Show_Drive_Letters_First.reg)
- **Desfazer:** [Show_Drive_Letters_Last.reg](../../Regfiles/Undo/Show_Drive_Letters_Last.reg)

**Opção de reversão:** Mostrar letras de unidade após a etiqueta da unidade.

### Mostrar letras de unidade após a etiqueta da unidade

Esta configuração mostrará as letras de unidade após a etiqueta da unidade no Explorador de Arquivos (comportamento padrão do Windows).

**Parâmetro:** `-ShowDriveLettersLast`

- **Aplicar:** [Show_Drive_Letters_Last.reg](../../Regfiles/Show_Drive_Letters_Last.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

### Mostrar letras de unidade de rede antes da etiqueta da unidade

Esta configuração mostrará apenas as letras de unidade de rede antes da etiqueta da unidade no Explorador de Arquivos.

**Parâmetro:** `-ShowNetworkDriveLettersFirst`

- **Aplicar:** [Show_Network_Drive_Letters_First.reg](../../Regfiles/Show_Network_Drive_Letters_First.reg)
- **Desfazer:** [Show_Drive_Letters_Last.reg](../../Regfiles/Undo/Show_Drive_Letters_Last.reg)

**Opção de reversão:** Mostrar letras de unidade após a etiqueta da unidade.

### Ocultar todas as letras de unidade

Esta configuração ocultará todas as letras de unidade do painel de navegação do Explorador de Arquivos e 'Este Computador'.

**Parâmetro:** `-HideDriveLetters`

- **Aplicar:** [Hide_Drive_Letters.reg](../../Regfiles/Hide_Drive_Letters.reg)
- **Desfazer:** [Show_Drive_Letters_Last.reg](../../Regfiles/Undo/Show_Drive_Letters_Last.reg)

**Opção de reversão:** Mostrar letras de unidade após a etiqueta da unidade.

<a id="gaming"></a>
## Jogos

### Desabilitar gravação de tela/jogos do Xbox

Isto desabilitará as funcionalidades de gravação de tela/jogos do Xbox incluídas com o app Game Bar. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableDVR`

- **Aplicar:** [Disable_DVR.reg](../../Regfiles/Disable_DVR.reg)
- **Desfazer:** [Enable_DVR.reg](../../Regfiles/Undo/Enable_DVR.reg)

**Opção de reversão:** Habilitar gravação de tela/jogos do Xbox.

### Desabilitar integração do Game Bar

Isto desabilitará a integração do Game Bar com jogos e controles. Isso impede os popups irritantes do ms-gamebar ao iniciar jogos ou conectar um controle.

**Parâmetro:** `-DisableGameBarIntegration`

- **Aplicar:** [Disable_Game_Bar_Integration.reg](../../Regfiles/Disable_Game_Bar_Integration.reg)
- **Desfazer:** [Enable_Game_Bar_Integration.reg](../../Regfiles/Undo/Enable_Game_Bar_Integration.reg)

**Opção de reversão:** Habilitar integração do Game Bar.

<a id="multi-tasking"></a>
## Multi-tarefa

### Desabilitar snapping de janelas

Isto desabilitará a capacidade de encaixar janelas nas laterais ou cantos da tela.

**Parâmetro:** `-DisableWindowSnapping`

- **Aplicar:** [Disable_Window_Snapping.reg](../../Regfiles/Disable_Window_Snapping.reg)
- **Desfazer:** [Enable_Window_Snapping.reg](../../Regfiles/Undo/Enable_Window_Snapping.reg)

**Opção de reversão:** Habilitar snapping de janelas.

### Desabilitar sugestões de apps ao encaixar janelas

Isto desabilitará as sugestões de apps quando você encaixar janelas nas laterais ou cantos da tela.

**Parâmetro:** `-DisableSnapAssist`

- **Aplicar:** [Disable_Snap_Assist.reg](../../Regfiles/Disable_Snap_Assist.reg)
- **Desfazer:** [Enable_Snap_Assist.reg](../../Regfiles/Undo/Enable_Snap_Assist.reg)

**Opção de reversão:** Habilitar sugestões de apps ao encaixar janelas.

**Build mínima do Windows:** `22000`.

### Ocultar painel de layouts de snap no topo da tela e no botão de maximizar

Isto desabilitará o painel de layouts de snap que aparece quando você passa o mouse sobre o botão de maximizar ou arrasta janelas para o topo da tela.

**Parâmetro:** `-DisableSnapLayouts`

- **Aplicar:** [Disable_Snap_Layouts.reg](../../Regfiles/Disable_Snap_Layouts.reg)
- **Desfazer:** [Enable_Snap_Layouts.reg](../../Regfiles/Undo/Enable_Snap_Layouts.reg)

**Opção de reversão:** Mostrar painel de layouts de snap no topo da tela e no botão de maximizar.

**Build mínima do Windows:** `22000`.

### Ocultar abas de apps ao encaixar ou pressionar Alt+Tab

Ocultar abas de apps ao encaixar ou pressionar Alt+Tab

**Parâmetro:** `-HideTabsInAltTab`

- **Aplicar:** [Hide_Tabs_In_Alt_Tab.reg](../../Regfiles/Hide_Tabs_In_Alt_Tab.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Mostrar 3 abas de apps ao encaixar ou pressionar Alt+Tab

Mostrar 3 abas de apps ao encaixar ou pressionar Alt+Tab

**Parâmetro:** `-Show3TabsInAltTab`

- **Aplicar:** [Show_3_Tabs_In_Alt_Tab.reg](../../Regfiles/Show_3_Tabs_In_Alt_Tab.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Mostrar 5 abas de apps ao encaixar ou pressionar Alt+Tab

Mostrar 5 abas de apps ao encaixar ou pressionar Alt+Tab

**Parâmetro:** `-Show5TabsInAltTab`

- **Aplicar:** [Show_5_Tabs_In_Alt_Tab.reg](../../Regfiles/Show_5_Tabs_In_Alt_Tab.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

### Mostrar 20 abas de apps ao encaixar ou pressionar Alt+Tab

Mostrar 20 abas de apps ao encaixar ou pressionar Alt+Tab

**Parâmetro:** `-Show20TabsInAltTab`

- **Aplicar:** [Show_20_Tabs_In_Alt_Tab.reg](../../Regfiles/Show_20_Tabs_In_Alt_Tab.reg)

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

<a id="optional-windows-features"></a>
## Funcionalidades Opcionais do Windows

### Habilitar Windows Sandbox

O Windows Sandbox é um ambiente de área de trabalho leve para executar aplicativos com segurança em isolamento. O software instalado dentro do ambiente Windows Sandbox permanece 'em sandbox' e é executado separadamente da máquina host. Suportado apenas nas edições Windows 11 Pro, Workstation e Enterprise.

**Parâmetro:** `-EnableWindowsSandbox`


**Opção de reversão:** Desabilitar Windows Sandbox.

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22483`.

### Habilitar Windows Subsystem for Linux

O Windows Subsystem for Linux permite que você execute um ambiente Linux diretamente no Windows sem a necessidade de uma máquina virtual.

**Parâmetro:** `-EnableWindowsSubsystemForLinux`


**Opção de reversão:** Desabilitar Windows Subsystem for Linux.

Para verificar as possibilidades de reversão, consulte [Restaurar alterações](Restaurar-alteracoes.md). A disponibilidade depende do recurso.

**Build mínima do Windows:** `22000`.

<a id="other"></a>
## Outros

### Ocultar página 'Inicial' do Configurações

Remove a página 'Inicial' do app Configurações.

**Parâmetro:** `-DisableSettingsHome`

- **Aplicar:** [Disable_Settings_Home.reg](../../Regfiles/Disable_Settings_Home.reg)
- **Desfazer:** [Enable_Settings_Home.reg](../../Regfiles/Undo/Enable_Settings_Home.reg)

**Opção de reversão:** Mostrar página 'Inicial' do Configurações.

**Build mínima do Windows:** `22000`.

### Desabilitar bloat no navegador Brave (IA, Crypto, etc.)

Isto desabilitará as funcionalidades de IA integradas do Brave, carteira Crypto, Notícias, Rewards, Talk e VPN. Esta funcionalidade usa políticas, que bloqueiam certas configurações.

**Parâmetro:** `-DisableBraveBloat`

- **Aplicar:** [Disable_Brave_Bloat.reg](../../Regfiles/Disable_Brave_Bloat.reg)
- **Desfazer:** [Enable_Brave_Bloat.reg](../../Regfiles/Undo/Enable_Brave_Bloat.reg)

**Opção de reversão:** Habilitar funcionalidades do navegador Brave (IA, Crypto, etc.).

## Parâmetros auxiliares e ações adicionais

### `-RemoveApps`

Remover os apps especificados com o parâmetro 'Apps'

### `-Apps`

A seleção de apps para remover, especificada como uma lista separada por vírgulas. Use 'Default' (ou omita) para usar a lista de apps padrão

### `-RemoveGamingApps`

Remover o App Xbox e o Xbox Gamebar

### `-RemoveHPApps`

Remover aplicativos OEM da HP

### `-CreateRestorePoint`

Criar um ponto de restauração do sistema

### `-ReplaceStart`

Substituir o layout do Menu Iniciar para este usuário apenas com o arquivo de modelo fornecido

### `-ReplaceStartAllUsers`

Substituir o layout do Menu Iniciar para todos os usuários existentes e novos com o arquivo de modelo fornecido

### `-ForceRemoveEdge`

Desinstalar Microsoft Edge forçadamente. NÃO RECOMENDADO!
