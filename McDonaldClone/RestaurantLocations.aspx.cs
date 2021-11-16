using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using McDonaldClone.Models;

namespace McDonaldClone {
    public partial class RestaurantLocations : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //Dear stranger, replace the second argument of the function call below with link with your own API key.
            //Find out more at Google Maps API Documentation
            mapFrame.Attributes.Add("src", new APIKey().GoogleMapLink());
        }
    }
}