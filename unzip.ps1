Param(
  [switch]$Z = $false,
  [switch]$p = $false,
  [string]$1 = $false
  # [Parameter(Mandatory = $true, Position = 0)]
  # [string]$zipfile,
  # [Parameter(ValueFromRemainingArguments=$true)][string[]]$files
)

# Write-Host "Z: $Z";
# Write-Host "p: $p";
# Write-Host "1: $1";
# # Write-Host "zipfile: $zipfile";
# # Write-Host "files: $files";
# Write-Host "args: $args";

$Assem = (
    "System.IO.Compression.FileSystem" ,
    "System.IO.Compression",
    "System.Core",
    "mscorlib"
    )

$Paths = (
    "c:/Users/leona/winbat/unzip.cs"
)

Add-Type -Path $Paths -ReferencedAssemblies $Assem

# function Unzip
# {
#     param([string]$zipfile, [string]$outpath)
#     [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
# }

if($p)
{
    # Unzip $1 $file
    [LBrayner.Tools.Zip]::ExtractFilesFromArchive($1,$files)
}

if($Z)
{
    if($files.length -gt 0)
    {
        # Write-Host "no. of files: $($files.Count)";
        $PSCmdlet.ThrowTerminatingError(
            [System.ArgumentException]::new("Only one archive can be specified.","files")
        )
    }
    [LBrayner.Tools.Zip]::ListArchiveFiles($1)
}

# [Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem')
# [IO.Compression.ZipFile]::OpenRead($sourceFile).Entries
