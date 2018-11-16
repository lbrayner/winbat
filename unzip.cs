using System;
using System.IO;
using System.IO.Compression;
using System.Collections.Generic;
using System.Linq;

namespace LBrayner.Tools
{
    public static class Zip
    {

        public static void ExtractFilesFromArchive(string archivePath, params string[] files)
        {

            using (ZipArchive archive = ZipFile.OpenRead(archivePath))
            {
                var result = from currEntry in archive.Entries
                             join file in files
                                 on currEntry.FullName equals file
                             select currEntry;


                var entries = new HashSet<string>(archive.Entries.Select(x => x.FullName));
                var notFound = files.Except(entries);

                if(notFound.Count() > 0)
                    throw new System.ArgumentException("One or more files are absent from archive.", "files");

                foreach (ZipArchiveEntry entry in result)
                    ReadToStdout(entry.Open());
            }
        } 

        public static void ListArchiveFiles(string archivePath)
        {
            using (ZipArchive archive = ZipFile.OpenRead(archivePath))
            {
                foreach(ZipArchiveEntry entry in archive.Entries)
                    Console.WriteLine(entry.FullName);
            }
        }

        private static void ReadToStdout(Stream input)
        {
            using (Stream myOutStream = Console.OpenStandardOutput())
            {
                byte[] buffer = new byte[16*1024];
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                    myOutStream.Write(buffer, 0, buffer.Length);
            }
        }

    }
}
