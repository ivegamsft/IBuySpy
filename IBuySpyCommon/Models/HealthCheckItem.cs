using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBuySpyCommon
{
    public class HealthCheckItem
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public bool Ok { get; set; }
        public string StatusMessage { get; set; }
        public List<Exception> Exceptions { get; set; }

        public HealthCheckItem(Guid HealthCheckId)
        {
            Id = HealthCheckId;
            Ok = false;
            Exceptions = new List<Exception>();
        }
    }
}
