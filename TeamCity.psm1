#--------------------------------------------------------------------------------------
# Module for TeamCity
#--------------------------------------------------------------------------------------

Function Get-TCArtifact {

<#
    .Synopsis
        Download Artifact from Team City

    .Description
        Download the zipped artifact from team City.

    .parameter Url
        Team City Root Url

    .Parameter Artifact
        Full path to the artifact file to download

    .parameter Destination
        Path to where the artifact should be downloaded

    .Link
        https://stackoverflow.com/questions/14242139/how-do-i-download-a-protected-file-using-powershell
#>

    [CmdletBinding()]
    Param (
        [Parameter ( Manditory = $True )]
        [String]$Url,

        [Parameter ( Manditory = $True )]
        [String]$Artifact,

        [Parameter ( Manditory = $True )]
        [String]$Destination

    )

    $Login = "$Url/ntlmlogin.html"

    $TeamCitySession = New-Object Microsoft.PowerShell.Commands.WebRequestSession

    Invoke-WebRequest -Uri $login -WebSession $TeamCitySession -UseDefaultCredentials -UseBasicParsing

    Invoke-WebRequest -Uri $artifacts -WebSession $TeamCitySession -UseBasicParsing -OutFile $Destination
}