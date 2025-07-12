using System;
using System.IO;
using System.Diagnostics;
using Verse;

[StaticConstructorOnStartup]
public static class CopyDefsAtStartup
{
    static CopyDefsAtStartup()
    {
        try
        {

            string localPath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            string localLowPath = Path.Combine(Path.GetDirectoryName(localPath), "LocalLow");

            string songsGameplayXMLSourcePath = Path.Combine(localLowPath, @"Ludeon Studios\RimWorld by Ludeon Studios\AddMyMusic_data\Songs_Gameplay.xml");
            string songsDBSourcePath = Path.Combine(localLowPath, @"Ludeon Studios\RimWorld by Ludeon Studios\AddMyMusic_data\music_is_here");

            string modDefsDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Mods", "custom_music", "Defs", "SongDefs");
            string modSoundsDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Mods", "custom_music", "Sounds", "Gameplay");

            if (!Directory.Exists(modDefsDir))
                Directory.CreateDirectory(modDefsDir);

            string modDefsPath = Path.Combine(modDefsDir, "Songs_Gameplay.xml");


            if (File.Exists(songsGameplayXMLSourcePath))
            {
                bool symlinkCreated = SymlinkHelper.CreateDirectorySymlink(modSoundsDir, songsDBSourcePath);
                File.Copy(songsGameplayXMLSourcePath, modDefsPath, true);
                Log.Message("[MyMod] Songs_Gameplay.xml скопирован в папку мода.");
            }
            else
            {
                Log.Warning("[MyMod] Исходный файл Songs_Gameplay.xml не найден.");
            }
            
        }
        catch (Exception e)
        {
            Log.Error("[MyMod] Ошибка при копировании Songs_Gameplay.xml: " + e);
        }
    }
}

public static class SymlinkHelper
{
    public static bool CreateDirectorySymlink(string linkPath, string targetPath)
    {
        try
        {
            var psi = new ProcessStartInfo("cmd.exe", $"mklink /D \"{linkPath}\" \"{targetPath}\"")
            {
                FileName = "cmd.exe",
                Arguments = $"/c mklink /D \"{linkPath}\" \"{targetPath}\"",
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                UseShellExecute = false,
                CreateNoWindow = true,
                Verb = "runas"
            };

            using var process = Process.Start(psi);
            process.WaitForExit();

            string output = process.StandardOutput.ReadToEnd();
            string error = process.StandardError.ReadToEnd();

            if (process.ExitCode == 0)
            {
                Log.Message($"Symlink создан: {output}");
                return true;
            }
            else
            {
                Log.Error($"Ошибка создания symlink: {error}");
                return false;
            }
        }
        catch (Exception e)
        {
            Log.Error($"Exception: {e}");
            return false;
        }
    }
}
