using IBuySpyCommon.RuntimeConstants;
using Microsoft.Azure;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;

namespace ASPNET.StarterKit.Commerce.AzureFeatures
{
    public static class IBuySpyFeatures
    {
        public static string BuildProductImageUrl(string productImageUrl, ImageSize Size)
        {
            string baseImageUrl;
            StringBuilder imageUrl = new StringBuilder();
            if (IBuySpyFeatures.UseBlobStorageForImages())
            {
                baseImageUrl = CloudConfigurationManager.GetSetting("BlobStorageBaseProductImageUrl");
                baseImageUrl = baseImageUrl.Trim(new char['/']);
                baseImageUrl = baseImageUrl.Trim(new char['\\']);

                switch (Size)
                {
                    case ImageSize.ExtraSmall:
                        {
                            imageUrl.Append($"https://{baseImageUrl}/productimages/xs/{productImageUrl}");
                            break;
                        }
                    case ImageSize.Small:
                        {
                            imageUrl.Append($"https://{baseImageUrl}/productimages/sm/{productImageUrl}");
                            break;
                        }
                    case ImageSize.Medium:
                        {
                            imageUrl.Append($"https://{baseImageUrl}/productimages/md/{productImageUrl}");
                            break;
                        }
                    case ImageSize.Large:
                        {
                            imageUrl.Append($"https://{baseImageUrl}/productimages/lg/{productImageUrl}");
                            break;
                        }
                    case ImageSize.XLarge:
                        {
                            imageUrl.Append($"https://{baseImageUrl}/productimages/xl/{productImageUrl}");
                            break;
                        }
                    default:
                        {
                            imageUrl.Append($"https://{baseImageUrl}/productimages/{productImageUrl}");
                            break;
                        }
                }
            }
            else
            {
                baseImageUrl = "/ProductImages";

                switch (Size)
                {
                    case ImageSize.ExtraSmall:
                    case ImageSize.Small:
                        {
                            imageUrl.Append($"{baseImageUrl}/thumbs/{productImageUrl}");
                            break;
                        }
                    case ImageSize.Medium:
                    case ImageSize.Large:
                    case ImageSize.XLarge:
                    default:
                        {
                            imageUrl.Append($"{baseImageUrl}/{productImageUrl}");
                            break;
                        }
                }
            }
            
            return imageUrl.ToString();
        }

        private static bool UseBlobStorageForImages()
        {
            string useBlobSetting = CloudConfigurationManager.GetSetting("UseBlobStorageForProductImages");
            bool useBlobs = false;

            if (bool.Parse(useBlobSetting) == true)
            {
                useBlobs = true;
            }
            return useBlobs;
            
        }

        public static bool ShowNewUI()
        {
            string uiSetting = CloudConfigurationManager.GetSetting("ShowNewUi");
            string qString = HttpContext.Current.Request.QueryString[IBuySpyCommon.Strings.QueryStrings.UserInterface];

            bool useNewUi = false;
            if (bool.Parse(uiSetting) == true)
            {
                useNewUi = true;
            }
            if (qString != null)
            {
                if (qString == "1")
                {
                    useNewUi = true;
                }
            }
            return useNewUi;
        }

        internal static bool UseAzureSearch()
        {
            string useAzureSearch = CloudConfigurationManager.GetSetting("UseAzureSearch");
            bool useNewSearch = false;
            //Only show the new search with the new UI
            if (ShowNewUI())
            {
                if (bool.Parse(useAzureSearch) == true)
                {
                    useNewSearch = true;
                }
            }
            return useNewSearch;
        }
    }
}
