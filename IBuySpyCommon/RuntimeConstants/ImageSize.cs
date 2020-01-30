using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBuySpyCommon.RuntimeConstants
{
    public enum ImageSize
    {
        ExtraSmall, Small, Medium, Large, XLarge
    }
    public static class ImageHelper
    {
        public static Dictionary<ImageSize, Size> imageDimensionsTable = new Dictionary<ImageSize, Size>()
        {
            { ImageSize.ExtraSmall, new Size(75, 75) },
            { ImageSize.Small, new Size(240, 240) },
            { ImageSize.Medium, new Size(460, 460) },
            { ImageSize.Large, new Size(500, 500) },
            { ImageSize.XLarge, new Size(800, 800) }
        };
    }
}
