using System;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace ASPNET.StarterKit.Commerce
{
	/// <summary>
	/// Summary description for Security.
	/// </summary>
	public class Security
	{
		//*********************************************************************
		//
		// Security.Encrypt() Method
		//
		// The Encrypt method encrypts a clean string into a hashed string
		//
		//*********************************************************************
		public static string Encrypt(string cleanString)
		{
			Byte[] clearBytes = new UnicodeEncoding().GetBytes(cleanString);
			Byte[] hashedBytes = ((HashAlgorithm) CryptoConfig.CreateFromName("MD5")).ComputeHash(clearBytes);
			
			return BitConverter.ToString(hashedBytes);
		}
	}
}
