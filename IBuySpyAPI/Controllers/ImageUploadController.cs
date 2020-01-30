using IBuySpyAPI.Helpers;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace IBuySpyAPI.Controllers
{
    [RoutePrefix("api/imageupload")]
    public class ImageUploadController : ApiController
    {
        // POST: api/imageupload/{ImageSize}
        [HttpPost, Route("{ImageSize}")]
        public async Task<IHttpActionResult> Post(string ImageSize)
        {
            string baseContainerName = "productimages";


            if (!Request.Content.IsMimeMultipartContent("form-data"))
            {
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            }

            string[] imageSizes = {"lg","md","sm","xl","xs"};

            if (!imageSizes.Contains(ImageSize))
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            var accountName = CloudConfigurationManager.GetSetting("storage:accountname");
            var accountKey = CloudConfigurationManager.GetSetting("storage:accountkey");
            var storageAccount = new CloudStorageAccount(new StorageCredentials(accountName, accountKey), true);
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            //Get the right container
            CloudBlobContainer imagesContainer = blobClient.GetContainerReference($"{baseContainerName}-{ImageSize}");
            var provider = new AzureStreamProvider(imagesContainer);

            try
            {
                await Request.Content.ReadAsMultipartAsync(provider);
            }
            catch (Exception ex)
            {
                return BadRequest($"An error has occured. Details: {ex.Message}");
            }

            // Retrieve the filename of the file you have uploaded
            var filename = provider.FileData.FirstOrDefault()?.LocalFileName;
            if (string.IsNullOrEmpty(filename))
            {
                return BadRequest("An error has occured while uploading your file. Please try again.");
            }

            return Ok($"File: {filename} has successfully uploaded");
        }
   }
}
