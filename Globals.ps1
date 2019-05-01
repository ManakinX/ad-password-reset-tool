#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------


#Sample function that provides the location of the script
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory

Function New-RandomPassword
{
	$rand = new-object System.Random
	$words = import-csv .\dict.csv
	$word = ($words[$rand.Next(0, $words.Count)]).Word
	$word1 = $word.substring(0, 1).toupper() + $word.substring(1).tolower()
	$numbers = Get-Random -Minimum 100 -Maximum 2000
	$specialChar = Get-Random -InputObject "!", "@", "?"
	return $word1 + $numbers + $specialChar
}
