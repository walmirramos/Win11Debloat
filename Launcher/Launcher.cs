using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Windows.Forms;

[assembly: AssemblyTitle("Win11Debloat")]
[assembly: AssemblyDescription("Iniciador da interface em português brasileiro")]
[assembly: AssemblyCompany("Dubbox")]
[assembly: AssemblyProduct("Win11Debloat")]
[assembly: AssemblyVersion("1.0.0.0")]
[assembly: AssemblyFileVersion("1.0.0.0")]

public static class Launcher
{
    public static string MissingResource(string directory)
    {
        foreach (string file in new[] { "Win11Debloat.ps1", "Config/Features.json", "Config/Languages/pt-BR/Chrome.json", "Schemas/MainWindow.xaml" })
            if (!File.Exists(Path.Combine(directory, file))) return file;
        foreach (string folder in new[] { "Assets", "Config", "Regfiles", "Schemas", "Scripts" })
            if (!Directory.Exists(Path.Combine(directory, folder))) return folder;
        return null;
    }

    public static ProcessStartInfo CreateStartInfo(string directory)
    {
        return new ProcessStartInfo {
            FileName = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.System), "WindowsPowerShell", "v1.0", "powershell.exe"),
            Arguments = "-NoLogo -NoProfile -STA -ExecutionPolicy Bypass -File \"" + Path.Combine(directory, "Win11Debloat.ps1") + "\" -Language pt-BR",
            WorkingDirectory = directory,
            UseShellExecute = true,
            WindowStyle = ProcessWindowStyle.Normal
        };
    }

    [STAThread]
    private static int Main(string[] args)
    {
        Application.EnableVisualStyles();
        try {
            if (args.Length != 0) {
                MessageBox.Show("Este iniciador abre a interface em português. Para usar parâmetros, execute Win11Debloat.ps1 pelo Windows PowerShell.", "Win11Debloat", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return 2;
            }
            string directory = AppDomain.CurrentDomain.BaseDirectory;
            string missing = MissingResource(directory);
            if (missing != null) {
                MessageBox.Show("Arquivo ou pasta não encontrado: " + missing + "\n\nExtraia o ZIP inteiro e mantenha o EXE junto das pastas do programa.", "Win11Debloat", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 1;
            }
            ProcessStartInfo info = CreateStartInfo(directory);
            if (!File.Exists(info.FileName)) throw new FileNotFoundException("O Windows PowerShell 5.1 não foi encontrado.", info.FileName);
            using (Process process = Process.Start(info)) {
                if (process == null) throw new InvalidOperationException("Não foi possível abrir o Windows PowerShell.");
            }
            return 0;
        }
        catch (Exception error) {
            MessageBox.Show("Não foi possível iniciar o programa.\n\n" + error.Message, "Win11Debloat", MessageBoxButtons.OK, MessageBoxIcon.Error);
            return 1;
        }
    }
}
