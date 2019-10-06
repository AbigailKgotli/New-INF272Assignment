using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Deliverable4.Startup))]
namespace Deliverable4
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
