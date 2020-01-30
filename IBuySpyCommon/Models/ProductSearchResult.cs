using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBuySpyCommon.Models
{
    public class ProductSearchResult
    {
        public string ProductId { get; set; }
        public string ModelNumber { get; set; }
        public string CategoryId { get; set; }

        public string ModelName { get; set; }

        public string ProductImage { get; set; }

        public double UnitCost { get; set; }
        public string Description { get; set; }
    }
}
