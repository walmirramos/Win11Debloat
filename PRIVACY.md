# Privacidade

O iniciador EXE abre os scripts locais do pacote no Windows PowerShell. Ele não inclui um serviço próprio de coleta de telemetria, não cria uma conta e não envia seus arquivos a um servidor do mantenedor.

## Conexões de rede

Algumas ações escolhidas pelo usuário podem envolver serviços externos. Por exemplo, o WinGet consulta serviços de aplicativos; links de ajuda, código-fonte e downloads abrem páginas do GitHub; ferramentas do Windows e componentes de terceiros podem usar seus próprios serviços. Essas interações estão sujeitas às políticas de privacidade dos respectivos fornecedores. O iniciador não usa a assinatura como autorização para transmitir dados.

## Arquivos locais

O programa pode salvar preferências, seleções, configurações exportadas, registros e backups. Eles podem conter nomes de contas do Windows, caminhos de arquivos e informações sobre aplicativos. Revise esses arquivos antes de compartilhá-los em um relato público. Backups e registros não são enviados automaticamente ao mantenedor pelo iniciador.

## Site e downloads

O site do projeto está hospedado no GitHub Pages, e os fontes, automações e Releases estão no GitHub. Esta página de apresentação não inclui analytics próprios ou formulário de cadastro; a preferência de tema é armazenada localmente no navegador. A infraestrutura do GitHub segue a [política de privacidade do GitHub](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement).

## Assinatura

A [política de assinatura](CODE_SIGNING.md) descreve o estado atual e a integração prevista. O EXE disponibilizado atualmente não está assinado pela SignPath.
