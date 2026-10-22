# Iniciador Win11Debloat

O EXE apenas abre o script local no Windows PowerShell 5.1, com a interface em português. O manifesto solicita administrador pelo controle de conta de usuário do Windows. A janela do PowerShell fica visível.

O iniciador não baixa código, não instala serviços, não altera o antivírus e não aplica ajustes automaticamente. As alterações continuam dependendo das escolhas feitas na interface. O parâmetro de política de execução é limitado ao processo do PowerShell, como no Run.bat existente.

## Compilar

No Windows PowerShell, execute `Launcher/Build-Launcher.ps1` na pasta do projeto. O compilador utilizado é o C# do .NET Framework instalado no Windows. O código-fonte e o manifesto estão nesta pasta.

## Distribuir e executar

Extraia o ZIP inteiro para uma pasta. Execute Win11Debloat.exe e confirme a solicitação de administrador. Mantenha as pastas Assets, Config, Regfiles, Schemas e Scripts junto do EXE.

O executável não possui assinatura digital. O Windows pode exibir um aviso de editor desconhecido ou de reputação, e produtos de segurança podem apresentar falsos positivos. Não é possível garantir aceitação por todos os antivírus. Não desative a proteção do computador para executar este programa.
